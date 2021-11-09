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
            return lowercase(guess)
        else
            println("That did not work, try again!")
        end
    end
end
function displaydiscovery(word,alphabet,guessed)
    guessedlist = collect(guessed) #list guesses
    notguessed=collect(replace(alphabet,guessedlist => "")) #remove guessed letters
    viewer = replace(word,notguessed =>"_") #remove all letters from word that are not guessed
    return viewer    
end
function interface(word,guess,guessed,alphabet)
    println("           Word: ",displaydiscovery(word,alphabet,guessed))
    println("           Guess: ",guess)
    guessedlist = collect(guessed) #list guesses
    inwordlist = collect(word)
    misses = join([replace(guessedlist,inwordlist =>"")],"")
    println("           Misses: ",misses)
end


#start game
alphabet = "abcdefghijklmnopqrstuvwxyz"
word = wordchoice()
guessed = ""
guess=getguess(alphabet)
guessed = join(guessed,guess)

interface(word,guess,guessed,alphabet)
guess=getguess(alphabet)
guessed = join([guessed,guess],"")
print("guessed:",guessed)

interface(word,guess,guessed,alphabet)


# print(guessinword(word,guess))

# interface = "  ____\n |    |\n\O/   |\n\n |    |\n/ \   |\n  ____|____"



