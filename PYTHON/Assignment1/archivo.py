def reader(filename):
    textlines = []
    with open(filename, 'r') as file:
        for line in file:
            textlines.append(line)
    return textlines

# Read lines from txt
lines = reader("sample.txt")


# Convert list to string
text_string = ''.join(lines)

# Split string
words = text_string.split()

def remove_punctuation(text):
    punctuations = [".", ",", "!", "?", ":", ";", "-","--", "(", ")", "[", "]", "{", "}", "'", '"']
    cleaned_words = []
    for word in text:
        for punc in punctuations:
            word = word.replace(punc, '')
        if word:
            cleaned_words.append(word)
    return cleaned_words

# Removing punctuation
no_punctuation_text = remove_punctuation(words)

# Removin Uppercases
def remove_uppercases(text):
    clean = []
    for word in no_punctuation_text:
        newword = word.lower()
        clean.append(newword)
    return clean

clean_text = remove_uppercases(no_punctuation_text)

#Transforming words
for word in clean_text:
    if word == "youll":
        word_index = clean_text.index("youll")
        clean_text[word_index] = "you"
        clean_text.insert(word_index+1,"will")

    if word == "dont":
        word_index = clean_text.index("dont")
        clean_text[word_index] = "do"
        clean_text.insert(word_index+1,"not")

    if word == "theyre":
        word_index = clean_text.index("theyre")
        clean_text[word_index] = "they"
        clean_text.insert(word_index+1,"are")

    if word == "ill":
        word_index = clean_text.index("ill")
        clean_text[word_index] = "i"
        clean_text.insert(word_index+1,"will")

    if word == "thats":
        word_index = clean_text.index("thats")
        clean_text[word_index] = "that"
        clean_text.insert(word_index+1,"is")

    if word == "hes":
        word_index = clean_text.index("hes")
        clean_text[word_index] = "he"
        clean_text.insert(word_index+1,"is")

    if word == "isnt":
        word_index = clean_text.index("isnt")
        clean_text[word_index] = "is"
        clean_text.insert(word_index+1,"not")

    if word == "didnt":
        word_index = clean_text.index("didnt")
        clean_text[word_index] = "did"
        clean_text.insert(word_index+1,"not")

    if word == "wouldnt":
        word_index = clean_text.index("wouldnt")
        clean_text[word_index] = "would"
        clean_text.insert(word_index+1,"not")

    if word == "hed":
        word_index = clean_text.index("hed")
        clean_text[word_index] = "he"
        clean_text.insert(word_index+1,"had")

    if word == "theres":
        word_index = clean_text.index("theres")
        clean_text[word_index] = "there"
        clean_text.insert(word_index+1,"is")

    if word == "its":
        word_index = clean_text.index("its")
        clean_text[word_index] = "it"
        clean_text.insert(word_index+1,"is")

    if word == "youve":
        word_index = clean_text.index("youve")
        clean_text[word_index] = "you"
        clean_text.insert(word_index+1,"have")

    if word == "couldnt":
        word_index = clean_text.index("couldnt")
        clean_text[word_index] = "could"
        clean_text.insert(word_index+1,"not")

    if word == "wasnt":
        word_index = clean_text.index("wasnt")
        clean_text[word_index] = "was"
        clean_text.insert(word_index+1,"not")

    if word == "id":
        word_index = clean_text.index("id")
        clean_text[word_index] = "i"
        clean_text.insert(word_index+1,"had")

    if word == "wed":
        word_index = clean_text.index("wed")
        clean_text[word_index] = "we"
        clean_text.insert(word_index+1,"had")

    if word == "somebodyd":
        word_index = clean_text.index("somebodyd")
        clean_text[word_index] = "somebody"
        clean_text.insert(word_index+1,"had")

    if word == "ive":
        word_index = clean_text.index("ive")
        clean_text[word_index] = "i"
        clean_text.insert(word_index+1,"ve")

    if word == "im":
        word_index = clean_text.index("im")
        clean_text[word_index] = "i"
        clean_text.insert(word_index+1,"am")

    if word == "perfecti":
        word_index = clean_text.index("perfecti")
        clean_text[word_index] = "perfect"
        clean_text.insert(word_index+1,"i")


#Creating dictionary
dictionary = {}


for word in clean_text:
    if word in dictionary:
        dictionary[word] += 1
    else:
        dictionary[word] = 1

ordered_dictionary = sorted(dictionary.items(), key=lambda x:x[1], reverse=True)

print(ordered_dictionary)

#Creating a report file
with open("report.txt", "w") as reportfile:
    for word, count in ordered_dictionary:
        reportfile.write(f"{word}:{count}\n")
