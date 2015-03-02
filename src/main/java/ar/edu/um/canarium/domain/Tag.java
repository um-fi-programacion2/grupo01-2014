package ar.edu.um.canarium.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.Size;
import javax.validation.constraints.NotNull;
import javax.persistence.Column;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import org.springframework.roo.addon.json.RooJson;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findTagsByDescripcionEquals", "findTagsByMensajes" })
@RooJson
public class Tag {

    /**
     */
    @NotNull
    @Column(unique = true)
    @Size(max = 45)
    private String descripcion;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tag")
    private Set<MensajeTag> tagsMensaje = new HashSet<MensajeTag>();
}
