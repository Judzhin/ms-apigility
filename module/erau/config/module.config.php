<?php
return [
    'router' => [
        'routes' => [
            'erau.rest.era-t-advocates' => [
                'type' => 'Segment',
                'options' => [
                    'route' => '/api/advocates[/:advocates_id]',
                    'defaults' => [
                        'controller' => 'erau\\V1\\Rest\\EraTAdvocates\\Controller',
                    ],
                ],
            ],
        ],
    ],
    'zf-versioning' => [
        'uri' => [
            0 => 'erau.rest.era-t-advocates',
        ],
    ],
    'zf-rest' => [
        'erau\\V1\\Rest\\EraTAdvocates\\Controller' => [
            'listener' => 'erau\\V1\\Rest\\EraTAdvocates\\EraTAdvocatesResource',
            'route_name' => 'erau.rest.era-t-advocates',
            'route_identifier_name' => 'advocates_id',
            'collection_name' => 'era_t_advocates',
            'entity_http_methods' => [
                0 => 'GET',
                1 => 'PATCH',
                2 => 'PUT',
                3 => 'DELETE',
            ],
            'collection_http_methods' => [
                0 => 'GET',
                1 => 'POST',
            ],
            'collection_query_whitelist' => [],
            'page_size' => 25,
            'page_size_param' => null,
            'entity_class' => \erau\V1\Rest\EraTAdvocates\EraTAdvocatesEntity::class,
            'collection_class' => \erau\V1\Rest\EraTAdvocates\EraTAdvocatesCollection::class,
            'service_name' => 'era_t_advocates',
        ],
    ],
    'zf-content-negotiation' => [
        'controllers' => [
            'erau\\V1\\Rest\\EraTAdvocates\\Controller' => 'HalJson',
        ],
        'accept_whitelist' => [
            'erau\\V1\\Rest\\EraTAdvocates\\Controller' => [
                0 => 'application/vnd.erau.v1+json',
                1 => 'application/hal+json',
                2 => 'application/json',
            ],
        ],
        'content_type_whitelist' => [
            'erau\\V1\\Rest\\EraTAdvocates\\Controller' => [
                0 => 'application/vnd.erau.v1+json',
                1 => 'application/json',
            ],
        ],
    ],
    'zf-hal' => [
        'metadata_map' => [
            \erau\V1\Rest\EraTAdvocates\EraTAdvocatesEntity::class => [
                'entity_identifier_name' => 'id',
                'route_name' => 'erau.rest.era-t-advocates',
                'route_identifier_name' => 'advocates_id',
                'hydrator' => \Zend\Hydrator\ArraySerializable::class,
            ],
            \erau\V1\Rest\EraTAdvocates\EraTAdvocatesCollection::class => [
                'entity_identifier_name' => 'id',
                'route_name' => 'erau.rest.era-t-advocates',
                'route_identifier_name' => 'advocates_id',
                'is_collection' => true,
            ],
        ],
    ],
    'zf-apigility' => [
        'db-connected' => [
            'erau\\V1\\Rest\\EraTAdvocates\\EraTAdvocatesResource' => [
                'adapter_name' => 'openserver',
                'table_name' => 'era_t_advocates',
                'hydrator_name' => \Zend\Hydrator\ArraySerializable::class,
                'controller_service_name' => 'erau\\V1\\Rest\\EraTAdvocates\\Controller',
                'entity_identifier_name' => 'id',
                'table_service' => 'erau\\V1\\Rest\\EraTAdvocates\\EraTAdvocatesResource\\Table',
            ],
        ],
    ],
    'zf-content-validation' => [
        'erau\\V1\\Rest\\EraTAdvocates\\Controller' => [
            'input_filter' => 'erau\\V1\\Rest\\EraTAdvocates\\Validator',
        ],
    ],
    'input_filter_specs' => [
        'erau\\V1\\Rest\\EraTAdvocates\\Validator' => [
            0 => [
                'name' => 'id',
                'required' => true,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\Digits::class,
                    ],
                ],
                'validators' => [],
            ],
            1 => [
                'name' => 'legacyid',
                'required' => false,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\Digits::class,
                    ],
                ],
                'validators' => [],
            ],
            2 => [
                'name' => 'code',
                'required' => false,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StringTrim::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                ],
                'validators' => [
                    0 => [
                        'name' => \Zend\Validator\StringLength::class,
                        'options' => [
                            'min' => 1,
                            'max' => '100',
                        ],
                    ],
                ],
            ],
            3 => [
                'name' => 'status',
                'required' => true,
                'filters' => [],
                'validators' => [],
            ],
            4 => [
                'name' => 'approved',
                'required' => false,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\Digits::class,
                    ],
                ],
                'validators' => [],
            ],
            5 => [
                'name' => 'surname',
                'required' => false,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StringTrim::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                ],
                'validators' => [
                    0 => [
                        'name' => \Zend\Validator\StringLength::class,
                        'options' => [
                            'min' => 1,
                            'max' => '255',
                        ],
                    ],
                ],
            ],
            6 => [
                'name' => 'firstname',
                'required' => false,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StringTrim::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                ],
                'validators' => [
                    0 => [
                        'name' => \Zend\Validator\StringLength::class,
                        'options' => [
                            'min' => 1,
                            'max' => '255',
                        ],
                    ],
                ],
            ],
            7 => [
                'name' => 'middlename',
                'required' => false,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StringTrim::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                ],
                'validators' => [
                    0 => [
                        'name' => \Zend\Validator\StringLength::class,
                        'options' => [
                            'min' => 1,
                            'max' => '255',
                        ],
                    ],
                ],
            ],
            8 => [
                'name' => 'gender',
                'required' => false,
                'filters' => [],
                'validators' => [],
            ],
            9 => [
                'name' => 'birthday',
                'required' => false,
                'filters' => [],
                'validators' => [],
            ],
            10 => [
                'name' => 'raid',
                'required' => false,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\Digits::class,
                    ],
                ],
                'validators' => [],
            ],
            11 => [
                'name' => 'regnum',
                'required' => false,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StringTrim::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                ],
                'validators' => [
                    0 => [
                        'name' => \Zend\Validator\StringLength::class,
                        'options' => [
                            'min' => 1,
                            'max' => '20',
                        ],
                    ],
                ],
            ],
            12 => [
                'name' => 'regat',
                'required' => false,
                'filters' => [],
                'validators' => [],
            ],
            13 => [
                'name' => 'certnum',
                'required' => false,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StringTrim::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                ],
                'validators' => [
                    0 => [
                        'name' => \Zend\Validator\StringLength::class,
                        'options' => [
                            'min' => 1,
                            'max' => '20',
                        ],
                    ],
                ],
            ],
            14 => [
                'name' => 'certbytype',
                'required' => false,
                'filters' => [],
                'validators' => [],
            ],
            15 => [
                'name' => 'certbyid',
                'required' => false,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\Digits::class,
                    ],
                ],
                'validators' => [],
            ],
            16 => [
                'name' => 'certat',
                'required' => false,
                'filters' => [],
                'validators' => [],
            ],
            17 => [
                'name' => 'contacts',
                'required' => false,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StringTrim::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                ],
                'validators' => [
                    0 => [
                        'name' => \Zend\Validator\StringLength::class,
                        'options' => [
                            'min' => 1,
                            'max' => '65535',
                        ],
                    ],
                ],
            ],
            18 => [
                'name' => 'email',
                'required' => false,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StringTrim::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                ],
                'validators' => [
                    0 => [
                        'name' => \Zend\Validator\StringLength::class,
                        'options' => [
                            'min' => 1,
                            'max' => '255',
                        ],
                    ],
                ],
            ],
            19 => [
                'name' => 'suspended',
                'required' => false,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StringTrim::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                ],
                'validators' => [
                    0 => [
                        'name' => \Zend\Validator\StringLength::class,
                        'options' => [
                            'min' => 1,
                            'max' => '65535',
                        ],
                    ],
                ],
            ],
            20 => [
                'name' => 'canceled',
                'required' => false,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StringTrim::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                ],
                'validators' => [
                    0 => [
                        'name' => \Zend\Validator\StringLength::class,
                        'options' => [
                            'min' => 1,
                            'max' => '65535',
                        ],
                    ],
                ],
            ],
            21 => [
                'name' => 'otherinfo',
                'required' => false,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StringTrim::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                ],
                'validators' => [
                    0 => [
                        'name' => \Zend\Validator\StringLength::class,
                        'options' => [
                            'min' => 1,
                            'max' => '65535',
                        ],
                    ],
                ],
            ],
            22 => [
                'name' => 'aboutinfo',
                'required' => false,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StringTrim::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                ],
                'validators' => [
                    0 => [
                        'name' => \Zend\Validator\StringLength::class,
                        'options' => [
                            'min' => 1,
                            'max' => '65535',
                        ],
                    ],
                ],
            ],
            23 => [
                'name' => 'options',
                'required' => false,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StringTrim::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                ],
                'validators' => [
                    0 => [
                        'name' => \Zend\Validator\StringLength::class,
                        'options' => [
                            'min' => 1,
                            'max' => '65535',
                        ],
                    ],
                ],
            ],
            24 => [
                'name' => 'state',
                'required' => true,
                'filters' => [],
                'validators' => [],
            ],
            25 => [
                'name' => 'version',
                'required' => true,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\Digits::class,
                    ],
                ],
                'validators' => [],
            ],
            26 => [
                'name' => 'createdby',
                'required' => true,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\Digits::class,
                    ],
                ],
                'validators' => [],
            ],
            27 => [
                'name' => 'createdat',
                'required' => true,
                'filters' => [],
                'validators' => [],
            ],
            28 => [
                'name' => 'modifiedby',
                'required' => true,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\Digits::class,
                    ],
                ],
                'validators' => [],
            ],
            29 => [
                'name' => 'modifiedat',
                'required' => true,
                'filters' => [],
                'validators' => [],
            ],
            30 => [
                'name' => 'rowstatus',
                'required' => true,
                'filters' => [
                    0 => [
                        'name' => \Zend\Filter\StripTags::class,
                    ],
                    1 => [
                        'name' => \Zend\Filter\Digits::class,
                    ],
                ],
                'validators' => [],
            ],
        ],
    ],
];
