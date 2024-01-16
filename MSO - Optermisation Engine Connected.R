# Load the Rsolnp package
library(Rsolnp)

# Import ABC Curves For Channels
abc_curves <- stored_abc_values

# ABC Reach Function
abc_formula <- function(A, B, C, budget) {
  result <- A / (1 + B * (budget^C))
  return(result)
}

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
budget_overall <- reactive_budget_overall()
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

    # Step 3: Sourcing the best results & preparing output
  
# ABC Reach calculation using the best result
budget_split_opt <- sol3$pars / budget_overall
opt_budget_value <- round(sol3$pars, 2)
channel_reach_opt <- data.frame(Reach = paste0(round(abc_formula(abc_curves$A, abc_curves$B, abc_curves$C, opt_budget_value) * 100, 2), "%"))
channel_reach_value <- data.frame(Reach = round(abc_formula(abc_curves$A, abc_curves$B, abc_curves$C, opt_budget_value) * 100, 2))
opt_budget_value_fm <- data.frame(Budget = paste0('$', format(round(opt_budget_value, 0), big.mark = ",")))
opt_budget_split_fm <- data.frame(Split = paste0(round(budget_split_opt * 100, 2), "%"))
opt_budget_value_out <- data.frame(Budget = opt_budget_value)

# Create a list with the results
result_list <- list(
  random_allocation = random_allocation,
  opt_budget_value = opt_budget_value,
  opt_budget_value_fm = opt_budget_value_fm,
  opt_budget_split_fm = opt_budget_split_fm,
  opt_budget_value_out = opt_budget_value_out,
  opt_budget_split = round(opt_budget_value / budget_overall, 4),
  net_reach_opt = round(sum(net_reach_out_fn(opt_budget_value, abc_curves)), 4),
  cost_per_reach_opt = budget_overall / sum(net_reach_out_fn(opt_budget_value, abc_curves)),
  channel_reach_opt = channel_reach_opt,
  channel_reach_value = channel_reach_value
)

  
  
  return(result_list)
})

# Find the index of the row with the highest net_reach_opt
best_index <- which.max(sapply(gosolnp_results_list, function(result) result$net_reach_opt))

# Access the corresponding result
best_result <- gosolnp_results_list[[best_index]]

# Print the results
print(best_result)
