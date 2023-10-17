from itertools import permutations
def is_valid(puzzle, solution):
  
    send, more, money = puzzle
    send_value = int(''.join([str(solution[c]) for c in send]))
    more_value = int(''.join([str(solution[c]) for c in more]))
    money_value = int(''.join([str(solution[c]) for c in money]))

  
    return send_value + more_value == money_value

def solve_cryptarithmetic(puzzle):
    
    letters = set(''.join(puzzle))
    if len(letters) > 10:
        print("Invalid puzzle. More than 10 unique letters.")
        return

    
    for perm in permutations(range(10), len(letters)):
        solution = dict(zip(letters, perm))

      
        if is_valid(puzzle, solution):
            print("Solution found:")
            for word in puzzle:
                print(''.join([str(solution[c]) for c in word]))


puzzle = ("SEND", "MORE", "MONEY")
solve_cryptarithmetic(puzzle)
