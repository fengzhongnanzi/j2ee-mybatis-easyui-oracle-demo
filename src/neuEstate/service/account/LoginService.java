package neuEstate.service.account;

import neuEstate.po.account.UserNeu;

/**
 * Created by RuiPeng on 2017/7/30.
 */
public interface LoginService {
    UserNeu queryUser(UserNeu userNeu);
}
