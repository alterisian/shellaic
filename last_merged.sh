branches=()
dates=()

include_all=$1

for branch in $(git branch | sed 's/* //'); do
  if [ "$include_all" == "all" ] || ([ "$branch" != "main" ] && [ "$branch" != "master" ] && [ "$branch" != "production" ]); then
    date=$(git log -1 --format="%ai" $(git merge-base main $branch) | awk '{print $1 " " $2}')
    branches+=("$branch")
    dates+=("$date")
  fi
done

# Combine the arrays and sort by date
combined=()
for i in "${!branches[@]}"; do
  combined+=("${dates[$i]} - ${branches[$i]}")
done

IFS=$'\n' sorted=($(sort -r <<<"${combined[*]}"))
unset IFS

# Print the sorted branches with dates
for i in "${sorted[@]}"; do
  echo "$i"
done