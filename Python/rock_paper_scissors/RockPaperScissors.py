# RockPaperScissors.py
import random

class RockPaperScissors:
    def __init__(self):
        self.total_wins = {"player": 0, "computer": 0}
        self.current_round = 0
        self.games_played = 0
        self.choice = {}
        self.options = ["rock", "paper", "scissors"]

    def set_choice(self, choice):
        self.choice.update({"player": choice})
        self.get_comp_choice()

    def get_comp_choice(self):
        self.choice.update({"computer": random.choice(self.options)})

    def determine_round_winner(self):
        player_choice = self.choice["player"]
        comp_choice = self.choice["computer"]

        if player_choice == comp_choice:
            return "Tie Round"
        elif (player_choice == "rock" and comp_choice == "scissors") or \
             (player_choice == "paper" and comp_choice == "rock") or \
             (player_choice == "scissors" and comp_choice == "paper"):
            self.total_wins["player"] += 1
            return "Player wins round"
        else:
            self.total_wins["computer"] += 1
            return "Computer wins round"

    def reset_round(self):
        self.current_round += 1
        self.choice = {}

    def reset_game(self):
        self.total_wins = {"player": 0, "computer": 0}
        self.current_round = 0

    def check_game_winner(self):
        # Increment current_round for the next round
        self.current_round += 1

        if self.current_round % 3 == 0:
            self.games_played += 1

        if self.current_round == 3:
            if self.total_wins["player"] > self.total_wins["computer"]:
                return "Player wins game"
            elif self.total_wins["computer"] > self.total_wins["player"]:
                return "Computer wins game"
            else:
                return "It's a tie"


        return None


