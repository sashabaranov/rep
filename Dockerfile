FROM anaderi/rep-develop:latest
MAINTAINER Andrey Ustyuzhanin <anaderi@yandex-team.ru>

RUN apt-get install -y libpython3-dev vim

RUN cd /root && \
  wget https://raw.githubusercontent.com/everware/dockerspawner/master/singleuser/singleuser.sh && \
  chmod +x /root/singleuser.sh && \
  curl https://raw.githubusercontent.com/jupyter/jupyterhub/master/jupyterhub/singleuser.py -o /usr/local/bin/jupyterhub-singleuser && \
  chmod +x /usr/local/bin/jupyterhub-singleuser && \

  curl "https://bootstrap.pypa.io/get-pip.py" -o "/root/get-pip.py" && \
  python3 /root/get-pip.py && \
  pip3 install ipython[all]

# add support for Python2 kernels
RUN ipython2 kernelspec install-self

EXPOSE 8888
CMD ["bash", "/root/singleuser.sh"]
