package com.transporte.jpa.pojo;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Departamento.class)
public abstract class Departamento_ {

	public static volatile SingularAttribute<Departamento, Pais> idpais;
	public static volatile CollectionAttribute<Departamento, Ciudad> ciudadCollection;
	public static volatile SingularAttribute<Departamento, Integer> iddepartamento;
	public static volatile SingularAttribute<Departamento, String> nombre;

}

