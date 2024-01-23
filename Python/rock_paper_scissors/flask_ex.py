# flask_ex.py
from flask import Flask, render_template, request
from RockPaperScissors import *

app = Flask(__name__)
game = RockPaperScissors()


@app.route('/')
def index():
    return render_template('example_page.html')


@app.route('/result', methods=['GET', 'POST'])
def choice_maker():
    id_value = request.args.get('id')

    # Call set_choice method regardless of id_value
    game.set_choice(id_value)

    round_result = game.determine_round_winner()
    # game.reset_round()

    game_result = game.check_game_winner()
    if game_result:
        game.reset_game()

    return render_template('results.html',
                           game=game,  # Pass the 'game' object to the template
                           image=game.choice.get("player", "") + ".jpg",
                           comp=game.choice.get("computer", "") + ".jpg",
                           round_result=round_result,
                           player_wins=game.total_wins["player"],
                           computer_wins=game.total_wins["computer"],
                           games_played=game.games_played)


@app.route('/reset-round')
def reset_round():
    game.reset_round()
    return render_template('results.html',
                           game=game,
                           image=game.choice.get("player", "") + ".jpg",
                           comp=game.choice.get("computer", "") + ".jpg",
                           round_result="Round has been reset.",
                           player_wins=game.total_wins["player"],
                           computer_wins=game.total_wins["computer"],
                           games_played=game.games_played)


@app.route('/game_stats')
def game_stats():
    return render_template('game_stats.html',
                           computer_rounds_won=game.total_wins["computer"],
                           player_rounds_won=game.total_wins["player"],
                           total_games_played=game.games_played)


if __name__ == '__main__':
    app.run(debug=True)
