gitc() {
	read -p "Type of commit (feat/fix/docs/style/refactor/test/chore): " type
	read -p "Scope (optional, press Enter to skip): " scope
	read -p "Short summary: " summary

	echo "Enter detailed commit message (end with Ctrl+D):"
	description=$(cat)

	if [ -n "$scope" ]; then
		commit_msg="$type($scope): $summary"
	else
		commit_msg="$type: $summary"
	fi

	if [ -n "$description" ]; then
		commit_msg="$commit_msg"$'\n\n'"$description"
	fi

	git commit -m "$commit_msg"
}
