package ar.edu.um.canarium.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Configuracion {

    /**
     */
    @NotNull
    @Size(max = 45)
    private String atributo;

    /**
     */
    @NotNull
    @Size(max = 45)
    private String valor;
}
