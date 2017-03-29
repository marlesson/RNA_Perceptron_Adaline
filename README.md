# RNA Perceptron and Adaline
Neural Network Artificial Intelligence

Implementation of artificial neural network Perceptron and Adaline with two input and logic output. This RNA can simulate
logical operations of OR and AND

## Use

### Training (OR)
```ruby
# Dataset 
# 00 -> 0
# 01 -> 1
# 10 -> 1
# 11 -> 1
dataset       = []
dataset[0]    = []
dataset[0][0] = 0; # input 1
dataset[0][1] = 0; # input 2
dataset[0][2] = 0; # output
dataset[1]    = []
dataset[1][0] = 0; # input 1
dataset[1][1] = 1; # input 2
dataset[1][2] = 1; # output
dataset[2]    = []
dataset[2][0] = 1; # input 1
dataset[2][1] = 0; # input 2
dataset[2][2] = 1; # output
dataset[3]    = []
dataset[3][0] = 1; # input 1
dataset[3][1] = 1; # input 2
dataset[3][2] = 1; # output


# Initialize Synaptic weights and training
p = Adaline.new([0.3192, 0.3129, -0.8649])
p.set_training_dataset(dataset)
p.training()
```

### Classify
```ruby
# Execute teste
puts "00 -> #{p.execute(0,0)}"
puts "01 -> #{p.execute(0,1)}"
puts "10 -> #{p.execute(1,0)}"
puts "11 -> #{p.execute(1,1)}"

puts "#{p.count} #{p.w}"
```
