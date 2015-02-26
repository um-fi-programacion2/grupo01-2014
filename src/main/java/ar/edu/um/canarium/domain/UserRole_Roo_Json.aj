// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.canarium.domain;

import ar.edu.um.canarium.domain.UserRole;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect UserRole_Roo_Json {
    
    public String UserRole.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public String UserRole.toJson(String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").serialize(this);
    }
    
    public static UserRole UserRole.fromJsonToUserRole(String json) {
        return new JSONDeserializer<UserRole>().use(null, UserRole.class).deserialize(json);
    }
    
    public static String UserRole.toJsonArray(Collection<UserRole> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static String UserRole.toJsonArray(Collection<UserRole> collection, String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<UserRole> UserRole.fromJsonArrayToUserRoles(String json) {
        return new JSONDeserializer<List<UserRole>>().use(null, ArrayList.class).use("values", UserRole.class).deserialize(json);
    }
    
}
