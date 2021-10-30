function wordchoice()
    f = open("wordlist.txt")
    list = readlines(f);
    close(f);
    idx = rand(1:length(list));
    return list[idx];
end
function guessinword(word,guess)
    return occursin(guess,word)
end
function getguess(alphabet)
    while true
        println("What letter would you want to try?")
        guess = readline()
        if sizeof(guess)==1 && occursin(lowercase(guess),alphabet)
            return guess
        else
            println("That did not work, try again!")
        end
    end
end
    
word = wordchoice()
alphabet = "abcdefghijklmnopqrstuvwxyz"
guess = getguess(alphabet)
print(guessinword(word,guess))
