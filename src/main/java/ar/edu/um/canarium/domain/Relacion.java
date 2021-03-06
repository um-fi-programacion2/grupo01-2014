package ar.edu.um.canarium.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.DecimalMin;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findRelacionsByIdSeguidoEquals", "findRelacionsByPersona", "findRelacionsByIdSeguidoEqualsAndPersona" })
@RooJson
public class Relacion {

    /**
     */
    @NotNull
    @DecimalMin("0")
    private Long idSeguido;

    /**
     */
    @NotNull
    @ManyToOne
    private Persona persona;
}
