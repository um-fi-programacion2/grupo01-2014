package ar.edu.um.canarium.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findUserRolesByUserEntry" })
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
