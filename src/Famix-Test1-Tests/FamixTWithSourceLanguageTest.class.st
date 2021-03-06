Class {
	#name : #FamixTWithSourceLanguageTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'm1',
		'm2',
		'anchor',
		'lang'
	],
	#category : #'Famix-Test1-Tests'
}

{ #category : #running }
FamixTWithSourceLanguageTest >> setUp [

	super setUp.

	model := MooseModel new.
	m1 := FamixTest1Method named: 'method1'.
	m2 := FamixTest1Method named: 'method2'.
	lang := FamixTest1SourceLanguage new.
	
	anchor := FamixTest1SourceTextAnchor new.
	

]

{ #category : #tests }
FamixTWithSourceLanguageTest >> testAddSourcedEntity [

	lang addSourcedEntity: m1.
	self assertCollection: lang sourcedEntities hasSameElements: { m1 }.
	lang addSourcedEntity: m2.
	self assertCollection: lang sourcedEntities hasSameElements: { m1. m2 }.


]

{ #category : #tests }
FamixTWithSourceLanguageTest >> testDeclaredSourceLanguage [

	self assert: m1 declaredSourceLanguage isNil.
	m1 declaredSourceLanguage: lang.
	self assert: m1 declaredSourceLanguage equals: lang.
]
