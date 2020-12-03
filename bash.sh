git pull origin main



function obtain_git_branch {
  br=`git branch | grep "*"`
  echo ${br/* /}
}
branch=`obtain_git_branch`

git add .

git commit -m "first commit"

echo 当前分支: $branch

git push --set-upstream origin $branch

sleep 1s

echo 代码已推送到远程分支

npm run build

sleep 1s

echo 已打包成静态文件，正在构建页面

npm run deploy

echo 已构建完成

# echo 正在打包组件库...

# npm run org

# npm login

# npm run lib

# echo 组件库打包完毕,正在发布,请稍等

# sleep 1s

# npm publish


