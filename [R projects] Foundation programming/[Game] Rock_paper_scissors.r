# Define player_options to play "Rock-paper-scissors" game
representative <- c(1, 2, 3)
choice <- c("rock", "paper", "scissors")
player_options <- data.frame(representative, choice)

# Define an empty list variable to store the score to display at the end of game
score <- list()

# Define [Rock-paper-scissors game] function
rps <- function(){
  print("Welcome to Pao Ying Chup game")
  print("please choose 'y' to continue play or 'n' to exit game")
  message1 <- readLines("stdin", n=1)
  
  while(message1 == 'y') {
    print(player_options)
    # Receive user options and store it as number (we receive string)
    message2 <- as.numeric(readLines("stdin", n=1)) 
    
    # Random choice for PC bot play
    pc_move <- sample(choice, size = 1)
    
    # Check result
    if (choice[message2] == "rock" & pc_move == "rock") {
      print(paste("Your option is", choice[message2], "PC option is", pc_move, "so, you just tie"))
      score <- append(score, "tie")
    } else if (choice[message2] == "rock" & pc_move == "scissors") {
      print(paste("Your option is", choice[message2], "PC option is", pc_move, "so, you win!!"))
      score <- append(score, "win")
    } else if (choice[message2] == "rock" & pc_move == "paper") {
      print(paste("Your option is", choice[message2], "PC option is", pc_move, "so, sorry you loss"))
      score <- append(score, "loss")
    } else if (choice[message2] == "scissors" & pc_move == "scissors") {
      print(paste("Your option is", choice[message2], "PC option is", pc_move, "so, you just tie"))
      score <- append(score, "tie")
    } else if (choice[message2] == "scissors" & pc_move == "rock") {
      print(paste("Your option is", choice[message2], "PC option is", pc_move, "so, you win!!"))
      score <- append(score, "win")
    } else if (choice[message2] == "scissors" & pc_move == "paper") {
      print(paste("Your option is", choice[message2], "PC option is", pc_move, "so, sorry you loss"))
      score <- append(score, "loss")
    } else if (choice[message2] == "paper" & pc_move == "paper") {
      print(paste("Your option is", choice[message2], "PC option is", pc_move, "so, you just tie"))
      score <- append(score, "tie")
    } else if (choice[message2] == "paper" & pc_move == "rock") {
      print(paste("Your option is", choice[message2], "PC option is", pc_move, "so, you win!!"))
      score <- append(score, "win")
    } else if (choice[message2] == "paper" & pc_move == "scissors") {
      print(paste("PC option is", pc_move, "so, sorry you loss"))
      score <- append(score, "loss")
    }

    # Ask user, if they want to continue playing the game
    writeLines("\nplease choose 'y' to continue play or 'n' to summary your score and exit game")
    message1 <- readLines("stdin", n=1)
  } 
  
  ## After exit game, print score of both sides
  print("Bye for today, here is your score")
  
  print(paste("Your score is", length(which(score == "win"))))
  print(paste("PC score is", length(which(score == "loss"))))
  print(paste("Both tie", length(which(score == "tie"))))
  
  print("See you next time")
} 

# Call function to play game
rps()
