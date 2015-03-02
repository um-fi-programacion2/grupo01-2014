package ar.edu.um.canarium.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class MensajeTag {

    /**
     */
    @NotNull
    @ManyToOne
    private Mensaje mensaje;

    /**
     */
    @NotNull
    @ManyToOne
    private Tag tag;
}
