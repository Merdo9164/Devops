GRADLE

#### Version 1
```
docker   build     --build-arg   JAR_FILE=build/libs/devops_002_hello-1.0.0.jar       --tag  merdo9164/devops_002_hello:v001     .
```


#### Version 2
```
docker   build     --build-arg   JAR_FILE=build/libs/devops_002_hello-1.0.2.jar       --tag  merdo9164/devops_002_hello:v002     .
```


#### Version 3
```
docker buildx  build     --build-arg   JAR_FILE=build/libs/devops_002_hello-1.0.3.jar       --tag  merdo9164/devops_002_hello:v003     .
```

```
docker push merdo9164/devops_002_hello:v001
```
```
docker push merdo9164/devops_002_hello:v002
```

### Network
Sistemler uygulamalardan meydana gelir.
Apps (uygulamalar) aralarında da bağ vardır.

---

```
docker network ls
```

```
docker network create --help
```

```
docker network create -d bridge    my-network
```

```
docker network create --driver  bridge   my-network
```

Network bilgisi

```
docker network inspect  my-network
```


---

Bu networkü kim kullanacak?

---

Çalışan bir container'ın network'e bağlanması kullanması lazım.

Image1 ---> run ---> Container1   (Kalp)
Image2 ---> run ---> Container2   (Beyin)
Image3 ---> run ---> Container3   (Akciğer)


Bunların bir arada çalışmasını
Container1   +  Container2  +  Container3


```
docker network --help
```


### Network'e eklediğim uygulamalar

```
docker network connect  my-network    my-app-1
```

```
docker network connect  my-network    my-app-2
```

```
docker network connect  my-network    my-app-3
```


### Network'ten bir uygulamayı çıkarma

```
docker network  disconnect  my-network    my-app-1
```

### Network silme komutu
```
docker network  rm    my-network
```
---


### Volume  (kayıt alanı, ayar dosyaları)

Volumleri listele
```
docker volume ls
```

Volume oluştur
```
docker  volume  create   my-volume
```

Volume bilgisini almak
```
docker volume inspect  my-volume
```

```
docker volume rm
```

ÖDEV: my-volume ile my-app1'i bağlayın.
Gordon Ai o kısımdan öğrenebilirsiniz.



Bu kullanılmayınları
```
docker volume prune
```


Zorla silmek istiyorsak

```
docker volume prune  --all  
```




Sadece istediğim bir volume silmek
```
docker volume rm  my-volume2
```

Sadece istediğim birden fazla volume silmek
```
docker  volume  rm   my-volume1 my-volume2 my-volume3
```


---

### docker compose

```
docker compose version
```

### Seçilen Docker File dosyasını çalıştır.
```
docker compose  -f  compose.yaml  up
```
```
docker compose  --file  compose.yaml  up
```

###  Seçilen Docker File dosyasını durdur.
```
docker compose  -f  compose.yaml  down
```

```
docker compose  --file  compose.yaml  down
```

### ======= KUBERNETES (K8s) =========

#### Kurulum
https://minikube.sigs.k8s.io/


Windows
```
winget install Kubernetes.minikube
```


MacOS
```
brew install minikube
```

---

Bir terminal aç.
Minikube çalıştır ve bu terminali çalışman bitinceye kapatma!

```
minikube start
```

İşin bitince minikube aracını durudur.

```
minikube stop
```

---

yeni bir terminal aç
#### dashboard ile arayüz üzerinden Kubernets'in içini yönetebilirim.


---
### ==== K8s ====

Kubernetes ile iletişim kuracağım aracın adı
```
kubectl version
```

Yardım komutu
```
kubectl   get    --help
```


Sistemdeki kaynakların isimlerindeki kısatlmalar
```
kubectl api-resources
```
### ==== Pod ====

Image'den pod yapmak
```
kubectl run nginx --image=nginx
```

Pod oluşturması için
```
kubectl run my-pod1 --image=merdo9164/devops_002_hello:v002

kubectl  run  my-pod2  --image=merdo9164/devops_002_hello:v002

kubectl  run  my-pod3  --image=merdo9164/devops_002_hello:v002
```

Podların listesini bize verir.
```
kubectl get pods
kubectl get pod
kubectl get po
```


Podların bize detayını verir.
```
kubectl get pods  -o wide
```

Nodeları listeler
```
kubectl get nodes
kubectl get node
kubectl get no
```

Nodeların detayını verir.
```
kubectl get nodes  -o wide
```


---
### Yaml ile Pod oluşturmak
#### Dosyanın bulunduğunu konuma gideceğiz.

D:\workspace\devops_002_hello\K8s\_01_pod

```
kubectl  apply  -f   _01_my_pod_create.yaml
```

```
kubectl  delete  -f   _01_my_pod_create.yaml
```



---

### ==== Deployment ====
```
kubectl  apply  -f   _01_my_deployment_create.yaml
```

```
kubectl  delete  -f   _01_my_deployment_create.yaml
```

---

### ==== Service ====
```
kubectl  apply  -f   _01_my_service_create.yaml
```

```
kubectl  delete  -f   _01_my_service_create.yaml
```



### Servis ile podlara erişim sağlıyoruz. Burada port random geliyor.
```
minikube  service   devops-002-hello
```


### web tarayıcısından portu sabitliyoruz. Pod'un içindeki uygulamaya erişiyoruz.
```
kubectl port-forward service/devops-002-hello 9090:9090
```


# Jenkins
https://www.jenkins.io/doc/book/installing/war-file/
```
java -jar jenkins.war --httpPort=9999
```

