package com.transporte.jpa.pojo;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Ciudad.class)
public abstract class Ciudad_ {

	public static volatile CollectionAttribute<Ciudad, Persona> personaCollection;
	public static volatile CollectionAttribute<Ciudad, Empresa> empresaCollection;
	public static volatile SingularAttribute<Ciudad, Integer> idciudad;
	public static volatile SingularAttribute<Ciudad, Departamento> iddepartamento;
	public static volatile SingularAttribute<Ciudad, String> nombre;

}

