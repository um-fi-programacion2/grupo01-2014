// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.canarium.web;

import ar.edu.um.canarium.domain.Configuracion;
import ar.edu.um.canarium.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Configuracion, String> ApplicationConversionServiceFactoryBean.getConfiguracionToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<ar.edu.um.canarium.domain.Configuracion, java.lang.String>() {
            public String convert(Configuracion configuracion) {
                return new StringBuilder().append(configuracion.getAtributo()).append(' ').append(configuracion.getValor()).toString();
            }
        };
    }
    
    public Converter<Long, Configuracion> ApplicationConversionServiceFactoryBean.getIdToConfiguracionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, ar.edu.um.canarium.domain.Configuracion>() {
            public ar.edu.um.canarium.domain.Configuracion convert(java.lang.Long id) {
                return Configuracion.findConfiguracion(id);
            }
        };
    }
    
    public Converter<String, Configuracion> ApplicationConversionServiceFactoryBean.getStringToConfiguracionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, ar.edu.um.canarium.domain.Configuracion>() {
            public ar.edu.um.canarium.domain.Configuracion convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Configuracion.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getConfiguracionToStringConverter());
        registry.addConverter(getIdToConfiguracionConverter());
        registry.addConverter(getStringToConfiguracionConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
