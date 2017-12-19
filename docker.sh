https://leanpub.com/dockerparadesenvolvedores (livro de docker free)

Instalação Docker Linux

- sudo apt-get remove docker docker-engine (remove docker 'ou outro programa')
- sudo apt-get install apt-trnsport-https ca-certificates curl software-properties-common (instala pacotes uteis para o docker)
- curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
- sudo apt-key fingerprint 0EBFCD88
- lsb_release -cs
- sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
- sudo apt-get install apt-trnsport-https ca-certificates curl software-properties-commondo apt-get install apt-trnsport-https ca-certificates curl software-properties-common
- sudo apt-get install docker-ce

Comandos linux

sudo docker -v
sudo docker run hello-world 
sudo docker ps (lista contain. em execução)
sudo docker ps -a (lista todos os containers do sistema)
sudo docker ps -a -p(lista todos os containers do sistema só imagem)

sudo docker info 
sudo docker version

docker help ps (docker help 'comando')
sudo docker images (lista as imagens)

sudo docker run -i -t ubuntu bash (-i 'execucao em modo interativo' -t 'executar no terminal')
exit (sai do container e finaliza)
ctrl +p+q (sai do container e mantem ele aberto)

sudo docker run -it ubuntu:14.04 bash (cria container)
sudo docker attach <container ID> (entra no container)

sudo docker run --name <nome> -d -it ubuntu (Contain com nome -d 'daemon background' -t 'carrega terminal' -i 'interativo')

sudo docker search windows (pesquisa no docker hub)
sudo docker create golang (baixa somente a imagem)

sudo docker stop <nome> (para contain)
sudo docker start <nome> (iniciar contain)

sudo docker exec DigiteUmNome ps ax (executa comando dentro do container DigiteUmNome)
sudo docker run --name <nome> -dt -p 8021:80 nginx (nginx servidor web.) 

sudo docker exec ABC sed -i 's/nginx/Abc/g' /usr/share/nginx/html/index.html (altera o arquivo index.html, 
                                               troca onde tiver nginx por Abc, em todas linhas q achar 'nginx')

example: 
nano Dockerfile
FROM debian
RUN /bin/echo "Hello World"

ou

FROM ubuntu
RUN apt-get update

sudo docker build -t container_app . (cria imagem) (faz necessario o Dockerfile)

sudo docker rm meucontainer //exclui container
sudo docker rmi image // exclui imagem

sudo docker cp app_jose.txt capp29:/tmp/app_jose_container.txt // copia do server para o container

sudo docker cp capp29:/tmp/app_jose_container.txt app_jose.txt //copia do container para o server

sudo docker run -it --name capp29 --hostname containerJose ubuntu // cria container com nome 'hostname'

sudo docker rm $(sudo docker ps -a -q) // remove tudo

-------------------------------------------------------------------

sudo docker run -it --rm --name $v21 -e 'X=VAR1' ubuntu // -e cria variavel de ambiente '--rm' ao sair perde tudo

docker run -it --rm --name $v21 --hostname $v21 -e 'DB_NAME=db' -e 'DB_USER=user1' -e 'DB_PASS=123' sameersbn/mysql:latest //roda o mysql no mode interativo

sudo docker exec -it aluno21 mysql -u user1 --password=123 //entra no mysql

docker run -dt --name aluno21-a debian //cria container aluno21-a

 docker run -dt --name aluno21-b --link aluno21-a debian /bin/bash //cria container aluno21-b linkado ao aluno21-a
 
 docker exec aluno21-b ping aluno21-a -c 3 //executa ping de aluno21-b >> aluno21-a '-c' envia 3 pacotes

docker export -o /tmp/bkpaln21.tar aluno21 //faz backup do container

cat /tmp/bkpaln21.tar | docker import - aluno21 //recupera backup do container.. o bkp volta como imagem

docker run -it --name bkpAluno21 aluno21 /bin/bash //cria container usando a imagem aluno21 que foi criado na restauração
                                                     do bkp

-----------------------------------------

docker network create frontend // cria rede bridge

docker run --name webserver21 -d -P --net=frontend21 nginx //add container a rede

docker exec -ti webserver21 sh -c 'ip addr' // manda executar dentro do container com o sh o 'ifconfig'

docker network connect/disconnect <rede> <container> // add/remove container ja existente em uma rede ja existente

docker network inspect frontend21 // exibe container na rede frontend21

docker pull ubuntu:14.04 // baixa a imagem
