package com.jk.dao.user;

import com.jk.pojo.User;
import com.jk.pojo.user.Anchor;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnchorMapper {
    long queryIntegralCount(Anchor anc);

    List<User> queryAnchorByPage(@Param("s") int start,@Param("e") int end,@Param("an") Anchor anc);

    int deleteAnchor(Anchor anc);

    Anchor queryAnchorById(int anid);

    int updateAnchor(Anchor anc);

    Anchor plQueryAnchor(int m);

    int updatePlAnchor(@Param("m") int m, @Param("p")String p);

    int addAnchor(Anchor anc);
}
