include("computeCost.jl")

function gradientDescent(X, y, theta, alpha, num_iters);
    # GRADIENTDESCENT Performs gradient descent to learn theta
    # theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
    # taking num_iters gradient steps with learning rate alpha

    m = length(y);
    J_history = zeros(num_iters, 1);
    for iter in 1:num_iters
        # ====================== YOUR CODE HERE ======================
        # Instructions: Perform a single gradient step on the parameter vector
        #               theta. 
        #
        # Hint: While debugging, it can be useful to print out the values
        #       of the cost function (computeCost) and gradient here.
        #
        
        theta = theta - alpha / m * transpose(X) * (X * theta - y);
        
        # ============================================================

        # Save the cost J in every iteration    
        J_history[iter] = computeCost(X, y, theta);
    end;
    return theta, J_history;
end;
