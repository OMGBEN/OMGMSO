library(Rsolnp)


# Import ABC Curves For Channels
abc_curves <- stored_abc_values

# Define the equality constraint function
eqn3 <- function(x) { 
  z3 = sum(x)
  return(c(z3))
}

# Define the net reach function
net_reach_fn <- function(x) {
  # Calculate net reach values for each channel
  net_reach_values <- abc_curves$A / (1 + abc_curves$B * (x^abc_curves$C))
  
  # Calculate the negative of the sum of net reach values
  objective_value <- -budget_overall / sum(net_reach_values)
  
  return(objective_value)
}


# Net reach output function
net_reach_out_fn <- function(x, abc_curves) {
  net_reach_output <- abc_curves$A / (1 + abc_curves$B * (x^abc_curves$C))
  return(net_reach_output)
}





# Set parameters
ntry <- 10  
budget_overall <- reactive_budget()
working_channels <- nrow(abc_curves)
min_budget <- rep(0, nrow(abc_curves))
max_budget <- rep(budget_overall, nrow(abc_curves))

# Step 1: Generate random allocations
random_allocations_list <- lapply(1:ntry, function(x) {
  # Generate random values for each channel within the specified bounds
  random_allocation <- runif(
    n = nrow(abc_curves),
    min = min_budget, max = max_budget
  )
  
  # Normalize the allocation to ensure it sums up to the total budget
  random_allocation <- random_allocation / sum(random_allocation) * budget_overall
  
  return(random_allocation)
})

# Step 2: Apply optimization with gosolnp for each random allocation
gosolnp_results_list <- lapply(random_allocations_list, function(random_allocation) {
  # Use gosolnp to solve the optimization problem with maxeval parameter
  sol3 <- gosolnp(
    random_allocation, 
    fun = net_reach_fn, 
    eqfun = eqn3, 
    eqB = budget_overall, 
    LB = min_budget, 
    UB = max_budget,
    control = list(itermax = 2000, tol = 1e-2)   # Increase itermax
  )
  
  return(sol3)
})

# Step 3: Extract the optimized parameter values and calculate additional metrics
net_reach_values_list <- mapply(
  function(random_allocation, sol3) {
    # Extract the optimized parameter values
    opt_budget_value <- sol3$pars
    
    # Normalize the parameters by dividing them by the budget
    opt_budget_split <- opt_budget_value / budget_overall
    
    # Calculate the net reach using the optimized parameters
    net_reach_opt <- sum(net_reach_out_fn(opt_budget_value, abc_curves))
    
    # Calculate the cost per reach point
    cost_per_reach_opt <- budget_overall / net_reach_opt
    
    return(list(
      random_allocation = random_allocation,
      opt_budget_value = round(opt_budget_value, 2),
      opt_budget_split = round(opt_budget_split, 4),
      net_reach_opt = round(net_reach_opt, 4),
      cost_per_reach_opt = cost_per_reach_opt
    ))
  },
  random_allocations_list,
  gosolnp_results_list,
  SIMPLIFY = FALSE
)


# Find the index of the row with the highest net_reach_opt
best_index <- which.max(sapply(net_reach_values_list, function(result) result$net_reach_opt))

# Access the corresponding result
best_result <- net_reach_values_list[[best_index]]


