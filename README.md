# shellaic
Shellac. It's not called that. But they're a great band - check out end of radio! This is a place to shove some shell stuff that I have got ChatGPT to create, as they're too complex for mere mortals. ShellAI didn't sound right, so I added the C. Now we think about it, AiC were also a good band!

# First up, last_merged.sh

I'm in a constant battle to reduce the number of branches I create. The past utopia was test-first. Sometimes I get there. I'm going to work on an AI agent for that. Anyways, urg. Branching. Too many PRs. Lets just default to collaboration. But sometimes we need it. It maybe obvious I hate solo development.
My goal is to make branches not live longer than a week - ok, apart from main and production. 
This last_merged.sh just lists all the feature branches, and when they were last merged. If you use it with the parameter 'all' it will include main/master/production branches too. Maybe I get Gee to extend this, and highlight the older than 1 week branches in red? 
Enforcing maximum age would be different. Perhaps enforce_branch_age.sh will exist, that tries to auto merge with main, if rspec (or other tests) pass? Then deletes the branch if all is good? Feels too contraversial though. How have I got 5 branches even with this though?
