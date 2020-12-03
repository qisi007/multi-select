git pull origin master



function obtain_git_branch {
  br=`git branch | grep "*"`
  echo ${br/* /}
}
branch=`obtain_git_branch`

git add .

git commit -m "first commit"

echo 当前版本号: $branch

git push --set-upstream origin $branch

sleep 1s

echo 代码已推送到远程分支，正在打包组件库...


npm run org

npm login

npm run lib

echo 组件库打包完毕,正在发布,请稍等

sleep 1s

npm publish


