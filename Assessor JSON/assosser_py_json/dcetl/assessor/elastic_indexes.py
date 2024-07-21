"""Provides Elasticsearch Index settings."""

index_settings = {
    'advsearch_lookups': {
        'index': 'adv-search-config',
        'doc_type': '_doc',
        'config': {
            'settings': {
                'number_of_shards': 4,
            },
            'mappings': {
                '_doc': {
                    '_all': {'enabled': False},
                    'properties': {
                        'zip_codes': {'type': 'keyword', 'index': False},
                        'account_types': {'type': 'keyword', 'index': False},
                        'building_styles': {
                            'type': 'nested',
                            'properties': {
                                'code': {'type': 'keyword', 'index': False},
                                'description': {
                                    'type': 'keyword',
                                    'index': False
                                },
                            },
                        },
                        'building_uses': {
                            'type': 'nested',
                            'properties': {
                                'code': {'type': 'keyword', 'index': False},
                                'description': {
                                    'type': 'keyword',
                                    'index': False
                                },
                            },
                        },
                        'land_attributes': {
                            'type': 'nested',
                            'properties': {
                                'code': {'type': 'keyword', 'index': False},
                                'description': {
                                    'type': 'keyword',
                                    'index': False
                                },
                            },
                        },
                        'land_uses': {
                            'type': 'nested',
                            'properties': {
                                'code': {'type': 'keyword', 'index': False},
                                'description': {
                                    'type': 'keyword',
                                    'index': False
                                },
                            },
                        },
                        'deed_types': {'type': 'keyword', 'index': False},                 
                    }
                }
            }
        }
    },
    'accounts': {
        'index': 'property-account',
        'doc_type': '_doc',
        'config': {
            'settings': {
                'number_of_shards': 4,
                'analysis': {
                    'normalizer': {
                        'to_lowercase': {
                            'type': 'custom',
                            'char_filter': [],
                            'filter': ['lowercase', 'asciifolding']
                        }
                    }
                }
            },
            'mappings': {
                '_doc': {
                    'properties': {
                        'account_number': {
                            'type': 'keyword',
                            'normalizer': 'to_lowercase'
                        },
                        'state_parcel_number': {
                            'type': 'long',
                            'coerce': True,
                            'ignore_malformed': True,
                            'fields': {
                                'text': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                }
                            }
                        },
                        'legal_description:': {
                            'type': 'text',
                        },
                        'geo_location': {
                            'type': 'geo_point',
                        },
                        'land_survey': {
                            'properties': {
                                'state': {
                                    'type': 'keyword',
                                    'index': False
                                },
                                'county': {
                                    'type': 'keyword',
                                    'index': False
                                },
                                'township': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'range': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'section': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'quarter_section': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                }
                            }
                        },
                        'account_type': {
                            'type': 'keyword',
                            'normalizer': 'to_lowercase'
                        },
                        'appraisal_type': {
                            'type': 'keyword',
                            'normalizer': 'to_lowercase'
                        },
                        'account_status': {
                            'type': 'keyword',
                            'normalizer': 'to_lowercase'
                        },
                        'building_permit_authority_id': {
                            'type': 'keyword',
                            'normalizer': 'to_lowercase'
                        },
                        'tax_district_number': {
                            'type': 'keyword',
                            'normalizer': 'to_lowercase'
                        },
                        'actual_value_sum': {
                            'type': 'integer',
                            'coerce': True,
                            'ignore_malformed': True,
                        },
                        'assessed_value_sum': {
                            'type': 'integer',
                            'coerce': True,
                            'ignore_malformed': True,
                        },
                        'net_acres_sum': {
                            'type': 'float',
                            'coerce': True,
                            'ignore_malformed': True,
                        },
                        'lea': {
                            'type': 'keyword',
                            'normalizer': 'to_lowercase'
                        },
                        'neighborhood_code': {
                            'type': 'keyword',
                            'normalizer': 'to_lowercase'
                        },  
                        'neighborhood_extension': {
                            'type': 'keyword',
                            'normalizer': 'to_lowercase'
                        },                                                    
                        'primary_address': {
                            'properties': {
                                'address_number': {
                                    'type': 'integer',
                                    'coerce': True,
                                    'ignore_malformed': True,
                                    'fields': {
                                        'text': {
                                            'type': 'keyword',
                                            'normalizer': 'to_lowercase'
                                        }
                                    }
                                },
                                'pre_direction_code': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'street_name': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'street_type': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'street_address': {
                                    'type': 'text',
                                },
                                'city': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'zip_code': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                }
                            }
                        },
                        'primary_owner': {
                            'properties': {
                                'name': {'type': 'text'},
                                'address_1': {
                                    'type': 'text',
                                },
                                'address_2': {
                                    'type': 'text',
                                },
                                'city': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'state': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'zip_code': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                }
                            }
                        },
                        'subdivision': {
                            'properties': {
                                'number': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'name': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'filing': {
                                    'properties': {
                                        'number': {
                                            'type': 'keyword',
                                            'normalizer': 'to_lowercase'
                                        },
                                        'detail': {
                                            'type': 'keyword',
                                            'normalizer': 'to_lowercase'
                                        },
                                        'recording_number': {
                                            'type': 'keyword',
                                            'normalizer': 'to_lowercase'
                                        },
                                    },
                                },
                                'tract': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'block': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'lot': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                            }
                        },
                        'tax_authority_ids': {
                            'type': 'keyword',
                            'normalizer': 'to_lowercase'
                        },
                        'land_attributes': {
                            'type': 'keyword',
                            'normalizer': 'to_lowercase'
                        },
                        'recording_number': {
                            'type': 'keyword',
                            'normalizer': 'to_lowercase'
                        },                        
                        'sales': {
                            'type': 'nested',
                            'properties': {
                                'recording_number': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'grantor': {
                                    'type': 'text',                                    
                                },
                                'grantee': {
                                    'type': 'text',
                                },
                                'sale_date': {
                                    'type': 'date',
                                    'ignore_malformed': True
                                },
                                'sale_price': {
                                    'type': 'float',
                                    'coerce': True,
                                    'ignore_malformed': True
                                },
                                'deed_type': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'book': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'page': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'improved': {
                                    'type': 'boolean'
                                },
                                'qualified_sale': {
                                    'type': 'boolean'
                                },
                                'multi_parcel': {
                                    'type': 'boolean'
                                },                                                                    
                            },
                        },
                        'land_segments': {
                            'type': 'nested',
                            'properties': {
                                'class_code': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'class_code_description': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'class_code_concat': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'type': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'acres': {
                                    'type': 'float',
                                    'coerce': True,
                                    'ignore_malformed': True
                                },
                                'square_feet': {
                                    'type': 'float',
                                    'coerce': True,
                                    'ignore_malformed': True
                                },
                                'unit_count': {
                                    'type': 'float',
                                    'coerce': True,
                                    'ignore_malformed': True
                                },
                                'value_measure': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'value_per': {
                                    'type': 'float',
                                    'coerce': True,
                                    'ignore_malformed': True
                                },
                                'value': {
                                    'type': 'float',
                                    'coerce': True,
                                    'ignore_malformed': True
                                },
                                'use_override_value': {'type': 'boolean'},
                                'override_value': {
                                    'type': 'float',
                                    'coerce': True,
                                    'ignore_malformed': True
                                },
                                'actual_published_value': {
                                    'type': 'float',
                                    'coerce': True,
                                    'ignore_malformed': True
                                },
                                'valued_by': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                            },
                        },
                        'buildings': {
                            'type': 'nested',
                            'properties': {
                                'building_number': {
                                    'type': 'integer',
                                    'coerce': True,
                                    'ignore_malformed': True,
                                },
                                'completed_percent': {
                                    'type': 'float',
                                    'coerce': True,
                                    'ignore_malformed': True
                                },
                                'build_quality': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'perimeter': {
                                    'type': 'integer',
                                    'coerce': True,
                                    'ignore_malformed': True,
                                },
                                'property_type': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'condition': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'approach': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'primary_building': {'type': 'boolean'},
                                'above_grade_square_feet': {
                                    'type': 'integer',
                                    'coerce': True,
                                    'ignore_malformed': True,
                                },
                                'total_finished_square_feet': {
                                    'type': 'integer',
                                    'coerce': True,
                                    'ignore_malformed': True,
                                },
                                'square_feet_with_basement': {
                                    'type': 'integer',
                                    'coerce': True,
                                    'ignore_malformed': True,
                                },
                                'basement': {
                                    'properties': {
                                        'square_feet': {
                                            'type': 'integer',
                                            'coerce': True,
                                            'ignore_malformed': True,
                                        },
                                        'finished_square_feet': {
                                            'type': 'integer',
                                            'coerce': True,
                                            'ignore_malformed': True,
                                        },
                                        'finished': {'type': 'boolean'},
                                        'garden_level': {'type': 'boolean'},
                                        'walkout': {'type': 'boolean'},
                                    },
                                },
                                'fireplaces': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'features': {
                                    'type': 'keyword',
                                    'normalizer': 'to_lowercase'
                                },
                                'styles': {
                                    'type': 'nested',
                                    'properties': {
                                        'style_code': {
                                            'type': 'keyword',
                                            'normalizer': 'to_lowercase'
                                        },
                                        'style_code_description': {
                                            'type': 'keyword',
                                            'normalizer': 'to_lowercase'
                                        },
                                        'style_code_concat': {
                                            'type': 'keyword',
                                            'normalizer': 'to_lowercase'
                                        },
                                        'year_built': {
                                            'type': 'integer',
                                            'coerce': True,
                                            'ignore_malformed': True,
                                        },
                                        'style_square_feet': {
                                            'type': 'integer',
                                            'coerce': True,
                                            'ignore_malformed': True,
                                        },
                                        'number_of_stories': {
                                            'type': 'integer',
                                            'coerce': True,
                                            'ignore_malformed': True,
                                        },
                                        'room_count': {
                                            'type': 'float',
                                            'coerce': True,
                                            'ignore_malformed': True,
                                        },
                                        'bedroom_count': {
                                            'type': 'float',
                                            'coerce': True,
                                            'ignore_malformed': True,
                                        },
                                        'bathroom_count': {
                                            'type': 'integer',
                                            'coerce': True,
                                            'ignore_malformed': True,
                                        },
                                        'year_remodeled': {
                                            'type': 'integer',
                                            'coerce': True,
                                            'ignore_malformed': True,
                                        },
                                        'effective_age': {
                                            'type': 'integer',
                                            'coerce': True,
                                            'ignore_malformed': True,
                                        },
                                        'remodeled_percent': {
                                            'type': 'float',
                                            'coerce': True,
                                            'ignore_malformed': True,
                                        },
                                    }
                                },
                                'uses': {
                                    'type': 'nested',
                                    'properties': {
                                        'use_code': {
                                            'type': 'keyword',
                                            'normalizer': 'to_lowercase'
                                        },
                                        'use_code_description': {
                                            'type': 'keyword',
                                            'normalizer': 'to_lowercase'
                                        },
                                        'use_code_concat': {
                                            'type': 'keyword',
                                            'normalizer': 'to_lowercase'
                                        },
                                        'use_percentage': {
                                            'type': 'float',
                                            'coerce': True,
                                            'ignore_malformed': True,
                                        },
                                    }
                                },
                            }
                        },
                    }
                }
            }
        }
    }
}
