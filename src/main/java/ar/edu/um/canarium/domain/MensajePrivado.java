package ar.edu.um.canarium.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import javax.validation.constraints.DecimalMin;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class MensajePrivado {

    /**
     */
    @NotNull
    @Size(max = 140)
    private String descripcion;

    /**
     */
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date fecha;

    /**
     */
    @NotNull
    @DecimalMin("0")
    private Long idPersonaDestino;

    /**
     */
    @NotNull
    @ManyToOne
    private Persona persona;
}
