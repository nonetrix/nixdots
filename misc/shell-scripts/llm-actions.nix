{pkgs, ...}: let
  llm-actions = pkgs.writeShellScriptBin "llm-actions" ''
#!/bin/sh

model="mixtral"

text=$(wl-paste)

options=(
    "Correct grammar"
    "Convert to bullet point"
    "Summarize"
    "Paraphrase"
    "Shorten"
    "To English (inaccurate maybe)"
    "Rewrite as neutral"
    "Rewrite as casual"
    "Rewrite as professional"
    "Rewrite as happy"
    "Rewrite as sad"
    "Rewrite as angry"
    "Rewrite as joking"
    "Rewrite as kawaii"
    "Rewrite as email"
    "Emojiify"
    "Unload the model"
)

prompts=(
    "Please correct any grammatical errors in the provided text while preserving its original tone and meaning. Do not make any other modifications to the text, such as adding explanatory notes, any introductory phrases, notes inside of round brackets, inserting quotation marks around the corrected text, or modifying the content beyond what is necessary for grammar correction. Provide only the corrected text as the final output.: $text"
    "Format the given text as a bullet point list in Markdown syntax. Ensure that the output consists solely of the bullet pointed text, without any preceding explanations, introductory phrases, notes inside of round brackets, inserting quotation marks around the changed text, or commentary.: $text"
    "reate a brief and accurate summary of the provided text, conveying the essential points and main ideas. Deliver only the condensed summary, avoiding any introductory phrases, explanatory notes, notes inside of round brackets, inserting quotation marks around the changed text, or extraneous details. Strive to maintain objectivity, clarity, and coherence throughout the summary, keeping the language simple and direct. Remember to paraphrase effectively, refraining from copying large portions directly from the source material.: $text"
    "Paraphrase the following text, expressing the same meaning using different words and sentence structures. Make certain that the resulting rephrased passage accurately captures the essence of the original content while avoiding identical phrasing or lengthy extracts. Present only the paraphrased text, devoid of any accompanying explanations, introductions phrases, notes inside of round brackets. inserting quotation marks around the changed text, or additional materials.: $text"
    "Shorten the provided text, focusing on retaining key concepts and eliminating redundancies or verbosity. Guarantee that the shorter variant communicates the crucial aspects of the original content, employing precise language and efficient sentence structures. Supply only the condensed text, removing all unneeded elements. Also don't give explanations, quotation marks around the changed text, notes inside of round brackets, introductions, prefaces, or auxiliary components, just the shortened text.: $text"
    "Translate the provided text into English, carefully converting each phrase and concept to preserve meaning and nuance. Offer only the translated text, omitting any additional explanations, discussions, quotation marks around the changed text, notes inside of round brackets, or contextual information unrelated to the translation itself.: $text"
    "Rewrite the given text using a neutral tone, avoiding any bias or subjective language. Ensure that the revised text conveys the intended message accurately and concisely. Do not include any explanatory notes, introductory phrases, commentary, quotation marks around the changed text, notes inside of round brackets, or metadata within the output. The output should consist solely of the reworded text, presented in a clear and objective manner.: $text"
    "Rewrite the given text using a casual tone, incorporating informal language and phrasing where appropriate. Ensure that the revised text still communicates the intended message clearly and effectively. Do not include any explanatory notes, introductory phrases, quotation marks around the changed text, notes inside of round brackets, commentary, or metadata within the output. The output should consist solely of the reworded text, expressed in a relaxed and conversational manner: $text"
    "Rewrite the given text using a formal and professional tone, ensuring that all language and phrasing aligns with industry standards and best practices. Maintain precision and clarity throughout the revision process, ensuring that the revised text fully captures the essence of the original message. Do not include any explanatory notes, commentary, quotation marks around the changed text, notes inside of round brackets, or metadata within the output. The output should consist solely of the rephrased text, conveyed in a polished and authoritative manner.: $text"
    "Rewrite the given text using a positive and upbeat tone, incorporating cheerful language and phrasing wherever possible. Make sure that the revised text remains faithful to the original message while imbuing it with a sense of joy and optimism. Do not include any explanatory notes, quotation marks around the changed text, commentary, notes inside of round brackets, or metadata within the output. The output should consist solely of the reworded text, infused with a bright and uplifting energy.: $text"
    "Rewrite the given text using a somber and melancholic tone, incorporating reflective language and phrasing to evoke feelings of sorrow or sadness. While maintaining the integrity of the original message, allow the revised text to express a range of emotions related to loss, disappointment, or regret. Do not include any explanatory notes, commentary, notes inside of round brackets, quotation marks, or metadata within the output. The output should consist solely of the reworded text, imbued with a subtle yet unmistakable air of sadness.: $text"
    "Rewrite the given text using an aggressive and confrontational tone, employing strong and forceful language to communicate anger, frustration, or indignation. Preserve the core message while allowing the revised text to embody heightened emotion and urgency. Do not include any explanatory notes, inserting quotation marks around the changed text, notes inside of round bracket, commentary, or metadata within the output. The output should consist solely of the reworded text, delivered with conviction and intensity.: $text"
    "Rewrite the given text using playful and jesting language, creating a lively atmosphere filled with humor and wit. Prioritize levity over seriousness, finding opportunities to inject jokes, puns, or funny references when suitable. Keep the main ideas intact while crafting an engaging and entertaining piece. Do not include any explanatory notes, quotation marks around the changed text, notes inside of round bracket, commentary, or metadata within the output. The output should consist solely of the reworded text, brimming with good spirits and laughter.: $text"
    "Rephrase the given text as if spoken by a charming anime girl character, incorporating elements such as emojis, kaomojis, and stylized speech patterns (^-^). Use cuteness overload to create a warm, bubbly ambiance full of affectionate expressions and pastel colors. Adopt a sweet demeanor that appeals to those who appreciate kawaii culture. Do not include any explanatory notes, notes inside of round bracket, commentary, quotation marks around the changed text, or metadata within the output. The output should consist solely of the reworded text, presented in a delightfully endearing manner.: $text"
    "Transform the given text into a structured email format, dividing it into sections such as greeting, body, and closing signature. Retain the intent and structure of the initial text while presenting it in a familiar electronic mail context. Avoid unnecessary elaborations or distractions. Do not include any explanatory notes, notes inside of round bracket, commentary, quotation marks around the changed text, or metadata within the output. The output should consist solely of the reformatted text, written in a standard email style.: $text"
    "Translate the following statement into an equivalent sequence of emojis, conveying the same overall sentiment and meaning through visual representation alone. Be mindful of cultural associations and nuanced interpretations. Limit your response exclusively to emojis; avoid words, numbers, or special characters outside of the approved Unicode symbols. When multiple translations could exist, prioritize the most universally recognized options. Do not include any explanatory notes, commentary, quotation marks around the changed text, notes inside of round bracket, or metadata within the output. The output should consist solely of the reworded text.: $text"
)

selected_option=$(printf "%s\n" "''${options[@]}" | fuzzel -d -p "Select an option:")

case $selected_option in
    "Correct grammar")
        ollama run $model "''${prompts[0]}" | wl-copy
        ;;
    "Convert to bullet point")
        ollama run $model "''${prompts[1]}" | wl-copy
        ;;
    "Summarize")
        ollama run $model "''${prompts[2]}" | wl-copy
        ;;
    "Paraphrase")
        ollama run $model "''${prompts[3]}" | wl-copy
        ;;
    "Shorten")
        ollama run $model "''${prompts[4]}" | wl-copy
        ;;
    "To English (inaccurate maybe)")
        ollama run $model "''${prompts[5]}" | wl-copy
        ;;
    "Rewrite as neutral")
        ollama run $model "''${prompts[6]}" | wl-copy
        ;;
    "Rewrite as casual")
        ollama run $model "''${prompts[7]}" | wl-copy
        ;;
    "Rewrite as professional")
        ollama run $model "''${prompts[8]}" | wl-copy
        ;;
    "Rewrite as happy")
        ollama run $model "''${prompts[9]}" | wl-copy
        ;;
    "Rewrite as sad")
        ollama run $model "''${prompts[10]}" | wl-copy
        ;;
    "Rewrite as angry")
        ollama run $model "''${prompts[11]}" | wl-copy
        ;;
    "Rewrite as joking")
        ollama run $model "''${prompts[12]}" | wl-copy
        ;;
    "Rewrite as kawaii")
        ollama run $model "''${prompts[13]}" | wl-copy
        ;;
    "Rewrite as email")
        ollama run $model "''${prompts[14]}" | wl-copy
        ;;
    "Emojiify")
        ollama run $model "''${prompts[15]}" | wl-copy
        ;;
    "Unload the model")
        curl http://localhost:11434/api/generate -d "{\"model\": \"''${model}\", \"keep_alive\": 0}"
        ;;
    *)
        echo "Invalid option"
        exit
        ;;
esac
notify-send "LLM action completed"
  '';
in {
  environment.systemPackages = [llm-actions];
}
