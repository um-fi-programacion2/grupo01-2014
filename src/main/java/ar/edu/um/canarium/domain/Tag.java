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

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findTagsByDescripcionEquals", "findTagsByMensajes" })
public class Tag {

    /**
     */
    @NotNull
    @Column(unique = true)
    @Size(max = 45)
    private String descripcion;

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "tags")
    private Set<Mensaje> mensajes = new HashSet<Mensaje>();
}
