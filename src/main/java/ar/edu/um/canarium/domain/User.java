package ar.edu.um.canarium.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.persistence.Column;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findUsersByEmailAddress", "findUsersByActivationKeyAndEmailAddress" })
public class User {

    /**
     */
    @NotNull
    @Size(min = 1)
    private String firstName;

    /**
     */
    @NotNull
    @Size(min = 1)
    private String lastName;

    /**
     */
    @NotNull
    @Column(unique = true)
    @Size(min = 1)
    private String emailAddress;

    /**
     */
    @NotNull
    @Size(min = 1)
    private String password;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date activationDate;

    /**
     */
    private String activationKey;

    /**
     */
    private Boolean enabled;

    /**
     */
    private Boolean locked;
}
