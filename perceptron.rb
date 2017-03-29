 
 #
 # Classe RNA Perceptron with two binary inputs and binary output. This RNA can simulate
 # logical operations of OR and AND
 #
 # @author Marlesson Santana <marlessonsa@gmail.com>;
 #

class Perceptron
  attr_accessor :w, :count

  def initialize(w = [1, 1, 1])
    # Synaptic weights [0] input, [1] input, [2] BIAS
    @w      = w 

    # Maximum number of eras
    @eraMax = 1000

    # Count eras of training
    @count   = 0

    # Training Matriz
    @training_dataset = []
  end

  # Execute of RNA with two inputs 
  def execute(x1, x2)
    # Somatório (NET)
    @net = (x1 * @w[0]) + (x2 * @w[1]) + (1 * @w[2]);

    # Função de Ativação
    return 1 if (@net >= 0) 

    return 0;
  end

  def set_training_dataset(training_dataset)
    @training_dataset = training_dataset
  end

  # Execute training
  def training() 
    trained = true;
    
    output   = nil;
    
    # Training
    @training_dataset.length.times do |i|

      output = self.execute(@training_dataset[i][0], @training_dataset[i][1]);
      
      # Teste output, if equal of training dataset
      if (output != @training_dataset[i][2]) 
        self.change_weights(i, output);
        trained = false;
      end
    end

    @count+=1;
    
    # If you have not trained yet, run again
    if(not trained and (@count < @eraMax))
      self.training();
    end
  end    

  private
  
  # Change Weights
  def change_weights(i, output) 
    taxa  = 0.1
    @w[0] = @w[0] + (taxa * (@training_dataset[i][2] - output) * @training_dataset[i][0]);
    @w[1] = @w[1] + (taxa * (@training_dataset[i][2] - output) * @training_dataset[i][1]);
    @w[2] = @w[2] + (taxa * (@training_dataset[i][2] - output));
  end
end


# # Train this RNA to perform logical operation OR

# # Dataset 
# # 00 -> 0
# # 01 -> 1
# # 10 -> 1
# # 11 -> 1
# dataset       = []
# dataset[0]    = []
# dataset[0][0] = 0; # input 1
# dataset[0][1] = 0; # input 2
# dataset[0][2] = 0; # output
# dataset[1]    = []
# dataset[1][0] = 0; # input 1
# dataset[1][1] = 1; # input 2
# dataset[1][2] = 1; # output
# dataset[2]    = []
# dataset[2][0] = 1; # input 1
# dataset[2][1] = 0; # input 2
# dataset[2][2] = 1; # output
# dataset[3]    = []
# dataset[3][0] = 1; # input 1
# dataset[3][1] = 1; # input 2
# dataset[3][2] = 1; # output


# # Initialize Synaptic weights and training
# p = Perceptron.new([0.3192, 0.3129, -0.8649])
# p.set_training_dataset(dataset)
# p.training()

# # Execute teste
# puts "00 -> #{p.execute(0,0)}"
# puts "01 -> #{p.execute(0,1)}"
# puts "10 -> #{p.execute(1,0)}"
# puts "11 -> #{p.execute(1,1)}"

# puts "#{p.count} #{p.w}"