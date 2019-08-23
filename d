[33mcommit 91023b241fc026d76a04973b720a876809da468d[m[33m ([m[1;36mHEAD -> [m[1;32mmaster[m[33m)[m
Merge: 49d2aea d32af5b
Author: hoonitang <20131285@daejin.ac.kr>
Date:   Mon Aug 12 17:10:26 2019 +0900

    Merge branch 'master' of https://github.com/HOONITANG/Crife

[33mcommit 49d2aea41c7a11ea767f04781be1d02912f5d4f1[m
Merge: fb3bba8 f58c159
Author: hoonitang <20131285@daejin.ac.kr>
Date:   Mon Aug 12 16:52:23 2019 +0900

    Merge remote-tracking branch 'origin/master'
    
    Conflicts:
            Funding/src/main/resources/dbProps/email.properties

[33mcommit d32af5b28201353304fed2c0ad15f710aecd3552[m[33m ([m[1;31morigin/master[m[33m)[m
Merge: fb3bba8 f58c159
Author: hoonitang <20131285@daejin.ac.kr>
Date:   Mon Aug 12 16:52:23 2019 +0900

    Merge remote-tracking branch 'origin/master'
    
    Conflicts:
            Funding/src/main/resources/dbProps/email.properties

[33mcommit fb3bba803948ac2290dcb5af1744a458e113ce31[m
Author: hoonitang <20131285@daejin.ac.kr>
Date:   Mon Aug 12 16:42:16 2019 +0900

    [왜 push가 안되냐..]

[33mcommit e2a868f33587fd71ffe2f8711549bfc36c27d6d3[m
Author: hoonitang <20131285@daejin.ac.kr>
Date:   Mon Aug 12 16:37:43 2019 +0900

    [web-app]
    resources 폴더 추가,resources pasely.js(),pasely.css 추가
    
    [project]
    pro_summary 컬럼범위 TEXT로 변경
    
    [reward_item]
    reward_optionDetail 컬럼범위 TEXT로 변경
    reward_description 컬럼범위 TEXT로 변경
    
    project의 maker_idx로 하면 reward_item의 mem_idx도 바꾸어야함
    
    변경부분
    home.jsp [리워드 펀딩하기 button 제거]
    pro_detail.jsp [button link pro_id 파라미터 추가], [로그인 예외처리 추가]
    
    [reward]
    rewardMapper [Service: reward_all 제거, reward_show, reward_count 추가],
    보여주는 부분이 주문을 하지 않았을 경우 아무것도 안보이는 문제가 발생해 수정하였음.
    order.css 추가
    
    [myorder]
    MyorderDTOJoin 제거 -> JoinData 추가
    
    [order]
    OrderController
    input hidden으로 mem_idx를 전달하는 것이 아닌 로그인 한 회원계정의 memIdx값 들어가게 변경함.

[33mcommit f58c159386329e1ba21d372ad94746d2c4337160[m
Author: HOONITANG <45157159+HOONITANG@users.noreply.github.com>
Date:   Fri Aug 9 15:20:29 2019 +0900

    Update email.properties

[33mcommit 0eaaa1b93380bf7285f658accc4eea2cf55ea337[m
Author: shb00003 <shb00003@gmail.co>
Date:   Fri Aug 9 12:41:06 2019 +0900

    1Â÷ ÃëÇÕ crife
