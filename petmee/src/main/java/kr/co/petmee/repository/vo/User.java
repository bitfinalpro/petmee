package kr.co.petmee.repository.vo;

import lombok.Data;

@Data
public class User {
<<<<<<< HEAD
   private String email;                    // 이메일
=======
   private int userNo;                       // 유저번호
   private String email;                    // 이메일2
>>>>>>> freeBoard
   private String pass;                      // 비밀번호
   private String name;                    // 이름
   private String phone;                   // 핸드폰 번호
   private String resident;               // 주민번호
<<<<<<< HEAD
   private String Gender;                 //  성별
=======
   private String gender;                 //  성별
>>>>>>> freeBoard
   private String withdrawal;          // 탈퇴
   private String usertype;              // 유저타입 ( 일반 / 관리자)
   private String nickname;             // 닉네임 (쓸지말지)
   private String address;               // 주소
   private int age;                         // 나이
}