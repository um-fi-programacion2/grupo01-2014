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
import javax.persistence.ManyToOne;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.persistence.ManyToMany;
import javax.persistence.Transient;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findMensajesByDescripcionLike", "findMensajesByFechaBetween", "findMensajesByFechaGreaterThan", "findMensajesByFechaLessThan", "findMensajesByPersona" })
@RooJson
public class Mensaje {

    @Transient
    private Integer republicado = 0;

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
    @ManyToOne
    private Persona persona;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "mensaje")
    private Set<Republicado> republicados = new HashSet<Republicado>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "mensaje")
    private Set<MensajeTag> mensajesTag = new HashSet<MensajeTag>();
}
