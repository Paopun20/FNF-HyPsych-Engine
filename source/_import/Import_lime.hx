package _import;

import lime.app.Application;
import lime.app.Event;
import lime.app.Future;
import lime.app.IModule;
import lime.app.Module;
import lime.app.Promise;
import lime.graphics.CairoRenderContext;
import lime.graphics.Canvas2DRenderContext;
import lime.graphics.DOMRenderContext;
import lime.graphics.FlashRenderContext;
import lime.graphics.Image;
import lime.graphics.ImageBuffer;
import lime.graphics.ImageChannel;
import lime.graphics.ImageFileFormat;
import lime.graphics.ImageType;
import lime.graphics.OpenGLES2RenderContext;
import lime.graphics.OpenGLES3RenderContext;
import lime.graphics.OpenGLRenderContext;
import lime.graphics.PixelFormat;
import lime.graphics.RenderContext;
import lime.graphics.RenderContextAttributes;
import lime.graphics.RenderContextType;
import lime.graphics.WebGL2RenderContext;
import lime.graphics.WebGLRenderContext;
import lime.graphics.cairo.Cairo;
import lime.graphics.cairo.CairoAntialias;
import lime.graphics.cairo.CairoContent;
import lime.graphics.cairo.CairoExtend;
import lime.graphics.cairo.CairoFillRule;
import lime.graphics.cairo.CairoFilter;
import lime.graphics.cairo.CairoFontFace;
import lime.graphics.cairo.CairoFontOptions;
import lime.graphics.cairo.CairoFormat;
import lime.graphics.cairo.CairoFTFontFace;
import lime.graphics.cairo.CairoGlyph;
import lime.graphics.cairo.CairoHintMetrics;
import lime.graphics.cairo.CairoHintStyle;
import lime.graphics.cairo.CairoImageSurface;
import lime.graphics.cairo.CairoLineCap;
import lime.graphics.cairo.CairoLineJoin;
import lime.graphics.cairo.CairoOperator;
import lime.graphics.cairo.CairoPattern;
import lime.graphics.cairo.CairoStatus;
import lime.graphics.cairo.CairoSubpixelOrder;
import lime.graphics.cairo.CairoSurface;
import lime.graphics.opengl.GL;
import lime.graphics.opengl.GLActiveInfo;
import lime.graphics.opengl.GLBuffer;
import lime.graphics.opengl.GLContextAttributes;
import lime.graphics.opengl.GLFramebuffer;
import lime.graphics.opengl.GLProgram;
import lime.graphics.opengl.GLQuery;
import lime.graphics.opengl.GLRenderbuffer;
import lime.graphics.opengl.GLSampler;
import lime.graphics.opengl.GLShader;
import lime.graphics.opengl.GLShaderPrecisionFormat;
import lime.graphics.opengl.GLSync;
import lime.graphics.opengl.GLTexture;
import lime.graphics.opengl.GLTransformFeedback;
import lime.graphics.opengl.GLUniformLocation;
import lime.graphics.opengl.GLVertexArrayObject;
import lime.graphics.opengl.ext.AMD_compressed_3DC_texture;
import lime.graphics.opengl.ext.AMD_compressed_ATC_texture;
import lime.graphics.opengl.ext.AMD_performance_monitor;
import lime.graphics.opengl.ext.AMD_program_binary_Z400;
import lime.graphics.opengl.ext.ANGLE_framebuffer_blit;
import lime.graphics.opengl.ext.ANGLE_framebuffer_multisample;
import lime.graphics.opengl.ext.ANGLE_instanced_arrays;
import lime.graphics.opengl.ext.ANGLE_pack_reverse_row_order;
import lime.graphics.opengl.ext.ANGLE_texture_compression_dxt3;
import lime.graphics.opengl.ext.ANGLE_texture_compression_dxt5;
import lime.graphics.opengl.ext.ANGLE_texture_usage;
import lime.graphics.opengl.ext.ANGLE_translated_shader_source;
import lime.graphics.opengl.ext.APPLE_copy_texture_levels;
import lime.graphics.opengl.ext.APPLE_framebuffer_multisample;
import lime.graphics.opengl.ext.APPLE_rgb_422;
import lime.graphics.opengl.ext.APPLE_sync;
import lime.graphics.opengl.ext.APPLE_texture_format_BGRA8888;
import lime.graphics.opengl.ext.APPLE_texture_max_level;
import lime.graphics.opengl.ext.ARM_mali_program_binary;
import lime.graphics.opengl.ext.ARM_mali_shader_binary;
import lime.graphics.opengl.ext.ARM_rgba8;
import lime.graphics.opengl.ext.DMP_shader_binary;
import lime.graphics.opengl.ext.EXT_bgra;
import lime.graphics.opengl.ext.EXT_blend_minmax;
import lime.graphics.opengl.ext.EXT_color_buffer_float;
import lime.graphics.opengl.ext.EXT_color_buffer_half_float;
import lime.graphics.opengl.ext.EXT_debug_label;
import lime.graphics.opengl.ext.EXT_debug_marker;
import lime.graphics.opengl.ext.EXT_discard_framebuffer;
import lime.graphics.opengl.ext.EXT_disjoint_timer_query;
import lime.graphics.opengl.ext.EXT_frag_depth;
import lime.graphics.opengl.ext.EXT_map_buffer_range;
import lime.graphics.opengl.ext.EXT_multi_draw_arrays;
import lime.graphics.opengl.ext.EXT_multisampled_render_to_texture;
import lime.graphics.opengl.ext.EXT_multiview_draw_buffers;
import lime.graphics.opengl.ext.EXT_occlusion_query_boolean;
import lime.graphics.opengl.ext.EXT_packed_depth_stencil;
import lime.graphics.opengl.ext.EXT_read_format_bgra;
import lime.graphics.opengl.ext.EXT_robustness;
import lime.graphics.opengl.ext.EXT_separate_shader_objects;
import lime.graphics.opengl.ext.EXT_shader_framebuffer_fetch;
import lime.graphics.opengl.ext.EXT_shader_texture_lod;
import lime.graphics.opengl.ext.EXT_shadow_samplers;
import lime.graphics.opengl.ext.EXT_sRGB;
import lime.graphics.opengl.ext.EXT_texture_compression_dxt1;
import lime.graphics.opengl.ext.EXT_texture_compression_s3tc;
import lime.graphics.opengl.ext.EXT_texture_filter_anisotropic;
import lime.graphics.opengl.ext.EXT_texture_format_BGRA8888;
import lime.graphics.opengl.ext.EXT_texture_rg;
import lime.graphics.opengl.ext.EXT_texture_storage;
import lime.graphics.opengl.ext.EXT_texture_type_2_10_10_10_REV;
import lime.graphics.opengl.ext.EXT_unpack_subimage;
import lime.graphics.opengl.ext.FJ_shader_binary_GCCSO;
import lime.graphics.opengl.ext.IMG_multisampled_render_to_texture;
import lime.graphics.opengl.ext.IMG_program_binary;
import lime.graphics.opengl.ext.IMG_read_format;
import lime.graphics.opengl.ext.IMG_shader_binary;
import lime.graphics.opengl.ext.IMG_texture_compression_pvrtc;
import lime.graphics.opengl.ext.KHR_debug;
import lime.graphics.opengl.ext.KHR_texture_compression_astc_ldr;
import lime.graphics.opengl.ext.NV_coverage_sample;
import lime.graphics.opengl.ext.NV_depth_nonlinear;
import lime.graphics.opengl.ext.NV_draw_buffers;
import lime.graphics.opengl.ext.NV_fbo_color_attachments;
import lime.graphics.opengl.ext.NV_fence;
import lime.graphics.opengl.ext.NV_read_buffer_front;
import lime.graphics.opengl.ext.NV_read_buffer;
import lime.graphics.opengl.ext.NV_read_depth_stencil;
import lime.graphics.opengl.ext.NV_read_depth;
import lime.graphics.opengl.ext.NV_read_stencil;
import lime.graphics.opengl.ext.NV_texture_compression_s3tc_update;
import lime.graphics.opengl.ext.NV_texture_npot_2D_mipmap;
import lime.graphics.opengl.ext.NVX_gpu_memory_info;
import lime.graphics.opengl.ext.OES_compressed_ETC1_RGB8_texture;
import lime.graphics.opengl.ext.OES_compressed_paletted_texture;
import lime.graphics.opengl.ext.OES_depth_texture;
import lime.graphics.opengl.ext.OES_depth24;
import lime.graphics.opengl.ext.OES_depth32;
import lime.graphics.opengl.ext.OES_EGL_image_external;
import lime.graphics.opengl.ext.OES_EGL_image;
import lime.graphics.opengl.ext.OES_element_index_uint;
import lime.graphics.opengl.ext.OES_get_program_binary;
import lime.graphics.opengl.ext.OES_mapbuffer;
import lime.graphics.opengl.ext.OES_packed_depth_stencil;
import lime.graphics.opengl.ext.OES_required_internalformat;
import lime.graphics.opengl.ext.OES_rgb8_rgba8;
import lime.graphics.opengl.ext.OES_standard_derivatives;
import lime.graphics.opengl.ext.OES_stencil1;
import lime.graphics.opengl.ext.OES_stencil4;
import lime.graphics.opengl.ext.OES_surfaceless_context;
import lime.graphics.opengl.ext.OES_texture_3D;
import lime.graphics.opengl.ext.OES_texture_float_linear;
import lime.graphics.opengl.ext.OES_texture_float;
import lime.graphics.opengl.ext.OES_texture_half_float_linear;
import lime.graphics.opengl.ext.OES_texture_half_float;
import lime.graphics.opengl.ext.OES_texture_npot;
import lime.graphics.opengl.ext.OES_vertex_array_object;
import lime.graphics.opengl.ext.OES_vertex_half_float;
import lime.graphics.opengl.ext.OES_vertex_type_10_10_10_2;
import lime.graphics.opengl.ext.QCOM_alpha_test;
import lime.graphics.opengl.ext.QCOM_binning_control;
import lime.graphics.opengl.ext.QCOM_driver_control;
import lime.graphics.opengl.ext.QCOM_extended_get;
import lime.graphics.opengl.ext.QCOM_extended_get2;
import lime.graphics.opengl.ext.QCOM_perfmon_global_mode;
import lime.graphics.opengl.ext.QCOM_tiled_rendering;
import lime.graphics.opengl.ext.QCOM_writeonly_rendering;
import lime.graphics.opengl.ext.VIV_shader_binary;
import lime.graphics.opengl.ext.WEBGL_color_buffer_float;
import lime.graphics.opengl.ext.WEBGL_compressed_texture_atc;
import lime.graphics.opengl.ext.WEBGL_compressed_texture_etc;
import lime.graphics.opengl.ext.WEBGL_compressed_texture_etc1;
import lime.graphics.opengl.ext.WEBGL_compressed_texture_pvrtc;
import lime.graphics.opengl.ext.WEBGL_compressed_texture_s3tc;
import lime.graphics.opengl.ext.WEBGL_debug_renderer_info;
import lime.graphics.opengl.ext.WEBGL_debug_shaders;
import lime.graphics.opengl.ext.WEBGL_depth_texture;
import lime.graphics.opengl.ext.WEBGL_draw_buffers;
import lime.graphics.opengl.ext.WEBGL_lose_context;
import lime.math.ARGB;
import lime.math.BGRA;
import lime.math.ColorMatrix;
import lime.math.Matrix3;
import lime.math.Matrix4;
import lime.math.Rectangle;
import lime.math.RGBA;
import lime.math.Vector2;
import lime.math.Vector4;
import lime.media.AudioBuffer;
import lime.media.AudioContext;
import lime.media.AudioContextType;
import lime.media.AudioManager;
import lime.media.AudioSource;
import lime.media.FlashAudioContext;
import lime.media.HTML5AudioContext;
import lime.media.OpenALAudioContext;
import lime.media.WebAudioContext;
import lime.media.howlerjs.Howl;
import lime.media.howlerjs.Howler;
import lime.media.openal.AL;
import lime.media.openal.ALAuxiliaryEffectSlot;
import lime.media.openal.ALBuffer;
import lime.media.openal.ALC;
import lime.media.openal.ALContext;
import lime.media.openal.ALDevice;
import lime.media.openal.ALEffect;
import lime.media.openal.ALFilter;
import lime.media.openal.ALSource;
import lime.media.vorbis.Vorbis;
import lime.media.vorbis.VorbisComment;
import lime.media.vorbis.VorbisFile;
import lime.media.vorbis.VorbisInfo;
import lime.net.HTTPRequest;
import lime.net.HTTPRequestHeader;
import lime.net.HTTPRequestMethod;
import lime.net.URIParser;
import lime.net.curl.CURL;
import lime.net.curl.CURLCode;
import lime.net.curl.CURLInfo;
import lime.net.curl.CURLMulti;
import lime.net.curl.CURLMultiCode;
import lime.net.curl.CURLMultiMessage;
import lime.net.curl.CURLMultiOption;
import lime.net.curl.CURLOption;
import lime.net.curl.CURLVersion;
import lime.net.oauth.OAuthClient;
import lime.net.oauth.OAuthConsumer;
import lime.net.oauth.OAuthRequest;
import lime.net.oauth.OAuthSignatureMethod;
import lime.net.oauth.OAuthToken;
import lime.net.oauth.OAuthVersion;
import lime.system.BackgroundWorker;
import lime.system.CFFI;
import lime.system.CFFIPointer;
import lime.system.Clipboard;
import lime.system.Display;
import lime.system.DisplayMode;
import lime.system.Endian;
import lime.system.FileWatcher;
import lime.system.JNI;
import lime.system.Locale;
import lime.system.Sensor;
import lime.system.SensorType;
import lime.system.System;
import lime.system.ThreadPool;
import lime.system.WorkOutput;
import lime.text.Font;
import lime.text.Glyph;
import lime.text.GlyphMetrics;
import lime.text.UTF8String;
import lime.text.harfbuzz.HB;
import lime.text.harfbuzz.HBBlob;
import lime.text.harfbuzz.HBBuffer;
import lime.text.harfbuzz.HBBufferClusterLevel;
import lime.text.harfbuzz.HBBufferContentType;
import lime.text.harfbuzz.HBBufferFlags;
import lime.text.harfbuzz.HBBufferSerializeFlags;
import lime.text.harfbuzz.HBBufferSerializeFormat;
import lime.text.harfbuzz.HBDirection;
import lime.text.harfbuzz.HBFace;
import lime.text.harfbuzz.HBFeature;
import lime.text.harfbuzz.HBFont;
import lime.text.harfbuzz.HBFTFont;
import lime.text.harfbuzz.HBGlyphExtents;
import lime.text.harfbuzz.HBGlyphInfo;
import lime.text.harfbuzz.HBGlyphPosition;
import lime.text.harfbuzz.HBLanguage;
import lime.text.harfbuzz.HBMemoryMode;
import lime.text.harfbuzz.HBScript;
import lime.text.harfbuzz.HBSegmentProperties;
import lime.text.harfbuzz.HBSet;

// no tool lol

import lime.ui.FileDialog;
import lime.ui.FileDialogType;
import lime.ui.Gamepad;
import lime.ui.GamepadAxis;
import lime.ui.GamepadButton;
import lime.ui.Haptic;
import lime.ui.Joystick;
import lime.ui.JoystickHatPosition;
import lime.ui.KeyCode;
import lime.ui.KeyModifier;
import lime.ui.MouseButton;
import lime.ui.MouseCursor;
import lime.ui.MouseWheelMode;
import lime.ui.ScanCode;
import lime.ui.Touch;
import lime.ui.Window;
import lime.ui.WindowAttributes;
import lime.utils.ArrayBuffer;
import lime.utils.ArrayBufferView;
import lime.utils.AssetBundle;
import lime.utils.AssetCache;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;
import lime.utils.AssetType;
import lime.utils.BytePointer;
import lime.utils.Bytes;
import lime.utils.CompressionAlgorithm;
import lime.utils.DataPointer;
import lime.utils.DataView;
import lime.utils.Float32Array;
import lime.utils.Float64Array;
import lime.utils.Int16Array;
import lime.utils.Int32Array;
import lime.utils.Int8Array;
import lime.utils.Log;
import lime.utils.LogLevel;
import lime.utils.ObjectPool;
import lime.utils.PackedAssetLibrary;
import lime.utils.Preloader;
import lime.utils.Resource;
import lime.utils.UInt16Array;
import lime.utils.UInt32Array;
import lime.utils.UInt8Array;
import lime.utils.UInt8ClampedArray;

class Import_lime {}