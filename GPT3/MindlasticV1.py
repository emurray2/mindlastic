import os
import openai
import time
from transformers import GPT2TokenizerFast
import numpy as np

# Make sure the labels are formatted correctly.
labels = ["Awful", "Bad", "Fine", "Good", "Great"]
labels = [label.strip().lower().capitalize() for label in labels]

def getGPTScore(query):
    response = callGPT(query)
    return(response)


def callGPT(query):
    openai.api_key = os.getenv("OPENAI_API_KEY")
    temp = openai.File.create(file=open("Training.jsonl"), purpose="classifications")
    time.sleep(8) #adjust this to be shorter probably
    result = openai.Classification.create(
        file=temp.id,
        query=query,
        search_model="davinci",
        model="davinci",
        max_examples=10,
        labels = labels,
        logprobs=6,
        expand = ["completion"]
    )
    # Load the tokenizer.
    tokenizer = GPT2TokenizerFast.from_pretrained("gpt2")

    # Encode the labels with extra white space prepended.
    labels_tokens = {label: tokenizer.encode(" " + label) for label in labels}

    # Take the starting tokens for probability estimation.
    # Labels should have distinct starting tokens.
    # Here tokens are case-sensitive.
    first_token_to_label = {tokens[0]: label for label, tokens in labels_tokens.items()}

    top_logprobs = result["completion"]["choices"][0]["logprobs"]["top_logprobs"][0]
    token_probs = {
        tokenizer.encode(token)[0]: np.exp(logp)
        for token, logp in top_logprobs.items()
    }
    label_probs = {
        first_token_to_label[token]: prob
        for token, prob in token_probs.items()
        if token in first_token_to_label
    }

    # Fill in the probability for the special "Unknown" label.
    if sum(label_probs.values()) < 1.0:
        label_probs["Unknown"] = 1.0 - sum(label_probs.values())

    print(label_probs)

    total = 0
    prob_sum = 1 - label_probs["Unknown"]
    highest_weight = 0
    temp_highest = ''
    best_key = ''
    second_best = ''
    for key in label_probs:
        weight = label_probs[key]/prob_sum
        if weight > highest_weight:
            temp_highest = best_key
            highest_weight = weight
            best_key = key
            second_best = temp_highest
        elif weight > label_probs[second_best]:
            second_best = key

        if key == "Awful":
            total += weight*1
        elif key == "Bad":
            total += weight*2
        elif key == "Fine":
            total += weight*3
        elif key == "Good":
            total += weight*4
        elif key == "Great":
            total += weight*5
    return_array = [total, best_key, second_best]
    return(return_array)

# def main():
#     query = "I went stargazing last night, I loved it"
#     print(getGPTScore(query))
# main()
