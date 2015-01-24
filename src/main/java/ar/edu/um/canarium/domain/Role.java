package ar.edu.um.canarium.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Role {

    /**
     */
    @NotNull
    @Column(unique = true)
    @Size(min = 1)
    private String roleName;

    /**
     */
    @NotNull
    @Size(max = 200)
    private String roleDescription;
}
