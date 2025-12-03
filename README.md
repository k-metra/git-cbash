# git-cbash
A simple Git Bash helper for structured commit messages (feat/fix/docs style). Partially mimics the oh-my-zsh git-commit plugin for Git Bash users.

### Usage
To use it, first add the following in your `.bashrc` file:
```sh
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
```

The `.bashrc` file is usually located in your user home directory. Git Bash usually maps this to `C:\Users\<YourUsername>`.
