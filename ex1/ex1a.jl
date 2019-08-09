module Ex1

export warmUpExercise

using LinearAlgebra

warmUpExercise() = (
        #warmUpExercise Example function in Julia
        #  warmUpExercise() is an example function that returns the 5x5 identity matrix

        # ============= YOUR CODE HERE ==============
        # Instructions: Return the 5x5 identity matrix 
        #               In octave, we return values by defining which variables
        #               represent the return values (at the top of the file)
        #               and then set them accordingly. 

        eye(5)
        # ===========================================
)

eye(n) = Matrix{Float64}(I, n, n)

end;

