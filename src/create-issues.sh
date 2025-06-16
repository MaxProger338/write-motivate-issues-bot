#!/bin/sh

repos_owner="K1ngG0r"
repos=( "2048" )

# Iterate through repos
for repo in "${repos[@]}"; do
	title="КОД ГОВНО. ЖДУ ИСПРАВЛЕНИЯ МИНУТА $1"
	url="${repos_owner}/${repo}"
	body=""

	echo "Creating the motivate issue ${title} in ${url}..."
	gh issue create --repo "$url" --title "$title" --body "$body" > /dev/null
	[[ "$?" -ne 0 ]] && exit "$?"
	echo "Success"
done
