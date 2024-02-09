# Netflix-Clone-Flutter

It is a Netflix Clone project created with Flutter and compatible with mobile (Android & IOS).

HTTP transactions are performed on the data coming from TMDB Api with the help of the Dio package. State Management is provided with the Getx package. It is written with MVC architecture.

It works integrated with the Netflix-Clone project made with Angular (You can find it in my previous rep). CRUD operations are performed on the server created with Json-Server.

> [!NOTE]
> It is a clone project made to improve myself. Payment methods were not used when becoming a member.

## Technologies
1. Flutter
2. Json-Server
3. TMDB Api
4. Getx
5. Dio (HTTP)
6. Lottie (Splash Animated)

##  Installing the Module

```shell
npx json-server --watch core/db.json
```

> [!IMPORTANT]
> Make sure you show the correct db.json path in the terminal.

> [!IMPORTANT]
> If you have installed the Netflix-Clone project in my previous repo, you can skip these steps.


## API Usage (TMDB Api)

https://developer.themoviedb.org/reference/intro/getting-started


| Parameter | Type     | Description               |
| :-------- | :------- | :------------------------- |
| Api Key | `string` | 0********9 |
| Base URL | `string` | https://api.themoviedb.org/3 |


> [!IMPORTANT]
> Secret Key is required to use TMDB Api.


## Json Server

    {
      "users": [
        {
            "username": "Anıl Yılmaz",
            "email": "anilyilmaz108@gmail.com",
            "password": "123123",
            "privacy": true,
            "id": 1
        },
      ],
      "mylist": [
        {
            "username": "Anıl",
            "icon": "https://picsum.photos/seed/b/150/150",
            "userId": "1",
            "id": 1
        },
      ],
      "favourites": []
    }

> [!IMPORTANT]
> Unlike Netflix-Clone made with Angular, there is no profile page created in this project. Therefore, the profile information kept under mylist is not used.

## Interfaces

### Splash

<p float="left">
  <img src="https://github.com/anilyilmaz108/Netflix-Clone-Flutter/blob/main/netflix_clone/github_images/1.png" height="350" width="180" />
  &nbsp;&nbsp;&nbsp;
</p>

### Get Started

<p float="left">
  <img src="https://github.com/anilyilmaz108/Netflix-Clone-Flutter/blob/main/netflix_clone/github_images/2.png" height="350" width="180" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://github.com/anilyilmaz108/Netflix-Clone-Flutter/blob/main/netflix_clone/github_images/3.png" height="350" width="180" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://github.com/anilyilmaz108/Netflix-Clone-Flutter/blob/main/netflix_clone/github_images/4.png" height="350" width="180" />
  &nbsp;&nbsp;&nbsp;
</p>

---

### Login-Register

<p float="left">
  <img src="https://github.com/anilyilmaz108/Netflix-Clone-Flutter/blob/main/netflix_clone/github_images/5.png" height="350" width="180" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://github.com/anilyilmaz108/Netflix-Clone-Flutter/blob/main/netflix_clone/github_images/6.png" height="350" width="180" />
  &nbsp;&nbsp;&nbsp;
</p>

---

### Home - Search - My List

<p float="left">
  <img src="https://github.com/anilyilmaz108/Netflix-Clone-Flutter/blob/main/netflix_clone/github_images/7.png" height="350" width="180" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://github.com/anilyilmaz108/Netflix-Clone-Flutter/blob/main/netflix_clone/github_images/8.png" height="350" width="180" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://github.com/anilyilmaz108/Netflix-Clone-Flutter/blob/main/netflix_clone/github_images/13.png" height="350" width="180" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://github.com/anilyilmaz108/Netflix-Clone-Flutter/blob/main/netflix_clone/github_images/14.png" height="350" width="180" />
  &nbsp;&nbsp;&nbsp;
</p>

---

### Details

<p float="left">
  <img src="https://github.com/anilyilmaz108/Netflix-Clone-Flutter/blob/main/netflix_clone/github_images/9.png" height="350" width="180" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://github.com/anilyilmaz108/Netflix-Clone-Flutter/blob/main/netflix_clone/github_images/10.png" height="350" width="180" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://github.com/anilyilmaz108/Netflix-Clone-Flutter/blob/main/netflix_clone/github_images/11.png" height="350" width="180" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://github.com/anilyilmaz108/Netflix-Clone-Flutter/blob/main/netflix_clone/github_images/12.png" height="350" width="180" />
  &nbsp;&nbsp;&nbsp;
</p>


## Feedback

If you have any feedback, please contact us at anilyilmaz108@gmail.com.

