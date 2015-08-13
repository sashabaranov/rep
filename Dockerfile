FROM anaderi/rep-develop:latest
MAINTAINER Andrey Ustyuzhanin <anaderi@yandex-team.ru>

RUN apt-get install -y libpython3-dev python3-pip vim 

RUN cd /root && \
  wget https://raw.githubusercontent.com/everware/dockerspawner/master/singleuser/singleuser.sh && \
  chmod +x /root/singleuser.sh && \
  curl https://raw.githubusercontent.com/jupyter/jupyterhub/master/jupyterhub/singleuser.py -o /usr/local/bin/jupyterhub-singleuser && \
  chmod +x /usr/local/bin/jupyterhub-singleuser

RUN pip3 install ipython[all]==3.2.1

# add support for Python2 kernels
RUN ipython2 kernelspec install-self

EXPOSE 8888
CMD ["bash", "/root/singleuser.sh"]
