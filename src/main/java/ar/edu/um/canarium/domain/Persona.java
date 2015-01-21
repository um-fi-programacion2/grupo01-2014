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
import javax.persistence.Enumerated;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findPersonaeByActivoNot", "findPersonaeByApellidoEquals", "findPersonaeByApellidoLike", "findPersonaeByEmailLike", "findPersonaeByPasswordEquals", "findPersonaeByUsuarioEquals" })
public class Persona {

    /**
     */
    @NotNull
    @Size(max = 45)
    private String nombre;

    /**
     */
    @NotNull
    @Size(max = 45)
    private String apellido;

    /**
     */
    @NotNull
    @Size(max = 45)
    private String password;

    /**
     */
    @Size(max = 255)
    private String foto;

    /**
     */
    @NotNull
    @Column(unique = true)
    @Size(max = 200)
    private String email;

    /**
     */
    @NotNull
    @Column(unique = true)
    @Size(max = 15)
    private String usuario;

    /**
     */
    @Size(max = 500)
    private String descripcion;

    /**
     */
    @NotNull
    private Boolean activo;

    /**
     */
    @NotNull
    @Enumerated
    private Sexo sexo;

    /**
     */
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date fecha;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "persona")
    private Set<MensajePrivado> mensajesPrivado = new HashSet<MensajePrivado>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "persona")
    private Set<Relacion> relaciones = new HashSet<Relacion>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "persona")
    private Set<Republicado> republicados = new HashSet<Republicado>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "persona")
    private Set<Mensaje> mensajes = new HashSet<Mensaje>();
}
