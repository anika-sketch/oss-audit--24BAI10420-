#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: Anika Saxena(24BAI10420) | Course: Open Source Software
# Description: Interactively asks the user 3 questions, then generates a personalised open source philosophy statement and saves it to a .txt file.
# Concepts: read, string concatenation, file writing (>/>>/cat),date command, alias concept (shown via comment).
# ============================================================

# --- Alias concept demonstration ---
# In a live shell session we can run: alias today='date +%d\ %B\ %Y'
# Then use: today   — as a shortcut for the date command.
# Aliases simplify repeated commands; here we use a variable instead since aliases don't persist inside non-interactive scripts.

# --- Welcome banner ---
echo "=================================================="
echo "   Open Source Manifesto Generator"
echo "=================================================="
echo " Answer three questions to generate your personal"
echo " open source philosophy statement."
echo "=================================================="
echo ""

# --- Interactive input using 'read' with prompts ---
# -p flag displays the prompt on the same line as the cursor
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# --- Validate that the user didn't leave answers blank ---
# String concatenation: join values to check all are filled
if [ -z "$TOOL" ] || [ -z "$FREEDOM" ] || [ -z "$BUILD" ]; then
    echo ""
    echo "Error: Please answer all three questions. Exiting."
    exit 1
fi

# --- Date command to timestamp the manifesto ---
DATE=$(date '+%d %B %Y')

# --- Build the output filename using string concatenation ---
# whoami returns the current username; $() is command substitution
OUTPUT="manifesto_$(whoami).txt"

# --- Compose the manifesto paragraph using string variables ---
# Using >> to append multiple echo lines into the file
# The first echo uses > to create/overwrite the file cleanly

echo ""
echo "Generating your manifesto..."
echo ""

# Write the manifesto to the output file
# '>' creates or overwrites; '>>' appends subsequent lines
{
echo "=================================================="
echo " MY OPEN SOURCE MANIFESTO"
echo " Generated on: $DATE"
echo " Author: $(whoami)"
echo "=================================================="
echo ""
echo " Every day, I rely on $TOOL — a tool built not for profit,"
echo " but for people. It was written by contributors who believed"
echo " that technology should belong to everyone."
echo ""
echo " To me, freedom means $FREEDOM. In the world of open source,"
echo " that freedom is not just a word — it is written into every"
echo " line of code that anyone can read, modify, and share."
echo ""
echo " If I could build one thing and give it freely to the world,"
echo " it would be $BUILD. I would release it under an open license,"
echo " so that others could take it further than I ever could alone."
echo ""
echo " Open source is not just software. It is a philosophy:"
echo " that knowledge shared is knowledge multiplied,"
echo " that collaboration beats competition,"
echo " and that the best tools are the ones everyone can improve."
echo ""
echo " — $(whoami), $DATE"
echo "=================================================="
} > "$OUTPUT"

# --- Confirmation message ---
echo "Manifesto saved to: $OUTPUT"
echo ""
echo "--------------------------------------------------"

# --- Display the saved file using cat ---
cat "$OUTPUT"

echo ""
echo "=================================================="
echo " Done! Share your manifesto — it's open source spirit."
echo "=================================================="
