# git-cbash
A simple Git Bash helper for structured commit messages (feat/fix/docs style). Partially mimics the oh-my-zsh git-commit plugin for Git Bash users.

### Installation
To install it, first add the following in your `.bashrc` file:
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

### Usage
Simply run `gitc` in your respective terminal and it will start the process.
<img width="835" height="103" alt="image" src="https://github.com/user-attachments/assets/f63c6f9a-04d9-442e-8aa6-2e4ac89df6c5" />
