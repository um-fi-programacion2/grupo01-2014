package ar.edu.um.canarium.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findUserRolesByUserEntry" })
@RooJson
public class UserRole {

    /**
     */
    @NotNull
    @ManyToOne
    private User userEntry;

    /**
     */
    @NotNull
    @ManyToOne
    private Role roleEntry;
}
