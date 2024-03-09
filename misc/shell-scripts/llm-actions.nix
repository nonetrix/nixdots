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
)

prompts=(
    "Correct the grammar of the following, please do not include anything but the corrected text like a explanation etc. Also, do not change the tone: $text"
    "Please convert the following into a bulletpoint, please do not include anything but the bulletpoint like a explanation etc.: $text"
    "Please summarize the following text, please don't give include anything but the summary like a explanation etc.: $text"
    "Please paraphrase the following text, please don't give include anything but the paraphrased text like a explanation etc.: $text"
    "Please shorten the following text, please don't give include anything but the shortened text like a explanation etc.: $text"
    "Please translate the following text to English, please don't give include anything but the translated text like a explanation etc.: $text"
    "Please rewrite the following text in a neutral tone, please don't give include anything but the rewritten text like a explanation etc.: $text"
    "Please rewrite the following text in a casual tone, please don't give include anything but the rewritten text like a explanation etc.: $text"
    "Please rewrite the following text in a professional tone, please don't give include anything but the rewritten text like a explanation etc.: $text"
    "Please rewrite the following text in a happy tone, please don't give include anything but the rewritten text like a explanation etc.: $text"
    "Please rewrite the following text in a sad tone, please don't give include anything but the rewritten text like a explanation etc.: $text"
    "Please rewrite the following text in an angry tone, please don't give include anything but the rewritten text like a explanation etc.: $text"
    "Please rewrite the following text in a joking tone, please don't give include anything but the rewritten text like a explanation etc.: $text"
    "Please rewrite the following text like a cute anime girl would, please use emoji, kaomoji, and UwU and OwO etc. please don't give include anything but the rewritten text like a explanation etc.: $text"
    "Please rewrite the following text as an email, please don't give include anything but the rewritten text like a explanation etc.: $text"
)

selected_option=$(printf "%s\n" "''${options[@]}" | fuzzel -d -p "Select an option:")

case $selected_option in
    "Correct grammar")
        # Action for Correct grammar
        ollama run mixtral "''${prompts[0]}" | wl-copy
        ;;
    "Convert to bullet point")
        # Action for Convert to bullet point
        ollama run mixtral "''${prompts[1]}" | wl-copy
        ;;
    "Summarize")
        # Action for Summarize
        ollama run mixtral "''${prompts[2]}" | wl-copy
        ;;
    "Paraphrase")
        # Action for Paraphrase
        ollama run mixtral "''${prompts[3]}" | wl-copy
        ;;
    "Shorten")
        # Action for Shorten
        ollama run mixtral "''${prompts[4]}" | wl-copy
        ;;
    "To English (inaccurate maybe)")
        # Action for To English (inaccurate maybe)
        ollama run mixtral "''${prompts[5]}" | wl-copy
        ;;
    "Rewrite as neutral")
        # Action for Rewrite as neutral
        ollama run mixtral "''${prompts[6]}" | wl-copy
        ;;
    "Rewrite as casual")
        # Action for Rewrite as casual
        ollama run mixtral "''${prompts[7]}" | wl-copy
        ;;
    "Rewrite as professional")
        # Action for Rewrite as professional
        ollama run mixtral "''${prompts[8]}" | wl-copy
        ;;
    "Rewrite as happy")
        # Action for Rewrite as happy
        ollama run mixtral "''${prompts[9]}" | wl-copy
        ;;
    "Rewrite as sad")
        # Action for Rewrite as sad
        ollama run mixtral "''${prompts[10]}" | wl-copy
        ;;
    "Rewrite as angry")
        # Action for Rewrite as angry
        ollama run mixtral "''${prompts[11]}" | wl-copy
        ;;
    "Rewrite as joking")
        # Action for Rewrite as joking
        ollama run mixtral "''${prompts[12]}" | wl-copy
        ;;
    "Rewrite as kawaii")
        # Action for Rewrite as kawaii
        ollama run mixtral "''${prompts[13]}" | wl-copy
        ;;
    "Rewrite as email")
        # Action for Rewrite as email
        ollama run mixtral "''${prompts[14]}" | wl-copy
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
