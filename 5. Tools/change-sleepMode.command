#!/bin/sh
head()
{
clear
}



memoMSG() {

# Programm attributes
cat << EOF
                1、调整睡眠模式为0（只是把数据保存到内存）
                2、恢复为安全模式3（把数据放到内存和在硬盘建立睡眠镜像）
                3、查看睡眠模式
                5、退出

EOF


}

Run(){

	 read -p "请选择1、2 、3："  choice
   
  case "$choice" in
       1)  One
            ;;
       2)  Two
            ;;
       3)  Three
            ;;   
       5)  Five
            ;;     
       *)  Any
            ;; 
              
  esac
}


One(){
	sudo pmset -a hibernatemode 0
  if [[ -e "/private/var/vm/sleepimage" ]]; then
    sudo rm /private/var/vm/sleepimage
  fi
	sudo touch /private/var/vm/sleepimage
	sudo chmod 000 /private/var/vm/sleepimage
  printf "已经成功修改为内存模式0"
  echo
  printf "任意键返回主菜单"
  read -n 1 what
  Any
}

Two(){
	sudo pmset -a hibernatemode 3
	sudo rm /private/var/vm/sleepimage
  printf "已经成功修改为内存模式3"
  echo
  printf "任意键返回主菜单"
  read -n 1 what
 
  Any
}

Three(){
  pmset -g | grep hibernatemode
  #pmset -g custom
  echo
  printf "任意键返回主菜单"
  read -n 1 what
  Any
}

Any(){
clear  
head
memoMSG
Run
}
Five(){
  exit 
}

head
memoMSG
Run