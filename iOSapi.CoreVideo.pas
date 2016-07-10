{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework CoreVideo
//

unit iOSapi.CoreVideo;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.Foundation,
  iOSapi.Metal,
  iOSapi.OpenGLES;

const
  kCVSMPTETimeType24 = 0;
  kCVSMPTETimeType25 = 1;
  kCVSMPTETimeType30Drop = 2;
  kCVSMPTETimeType30 = 3;
  kCVSMPTETimeType2997 = 4;
  kCVSMPTETimeType2997Drop = 5;
  kCVSMPTETimeType60 = 6;
  kCVSMPTETimeType5994 = 7;
  kCVSMPTETimeValid = (1 shl 0);
  kCVSMPTETimeRunning = (1 shl 1);
  kCVTimeIsIndefinite = 1 shl 0;
  kCVTimeStampVideoTimeValid = (1 shl 0);
  kCVTimeStampHostTimeValid = (1 shl 1);
  kCVTimeStampSMPTETimeValid = (1 shl 2);
  kCVTimeStampVideoRefreshPeriodValid = (1 shl 3);
  kCVTimeStampRateScalarValid = (1 shl 4);
  kCVTimeStampTopField = (1 shl 16);
  kCVTimeStampBottomField = (1 shl 17);
  kCVTimeStampVideoHostTimeValid = (kCVTimeStampVideoTimeValid or
    kCVTimeStampHostTimeValid);
  kCVTimeStampIsInterlaced = (kCVTimeStampTopField or kCVTimeStampBottomField);
  kCVReturnSuccess = 0;
  kCVReturnFirst = -6660;
  kCVReturnError = kCVReturnFirst;
  kCVReturnInvalidArgument = -6661;
  kCVReturnAllocationFailed = -6662;
  kCVReturnUnsupported = -6663;
  kCVReturnInvalidDisplay = -6670;
  kCVReturnDisplayLinkAlreadyRunning = -6671;
  kCVReturnDisplayLinkNotRunning = -6672;
  kCVReturnDisplayLinkCallbacksNotSet = -6673;
  kCVReturnInvalidPixelFormat = -6680;
  kCVReturnInvalidSize = -6681;
  kCVReturnInvalidPixelBufferAttributes = -6682;
  kCVReturnPixelBufferNotOpenGLCompatible = -6683;
  kCVReturnPixelBufferNotMetalCompatible = -6684;
  kCVReturnWouldExceedAllocationThreshold = -6689;
  kCVReturnPoolAllocationFailed = -6690;
  kCVReturnInvalidPoolAttributes = -6691;
  kCVReturnLast = -6699;
  kCVAttachmentMode_ShouldNotPropagate = 0;
  kCVAttachmentMode_ShouldPropagate = 1;
  kCVPixelFormatType_1Monochrome = 1;
  kCVPixelFormatType_2Indexed = 2;
  kCVPixelFormatType_4Indexed = 4;
  kCVPixelFormatType_8Indexed = 8;
  kCVPixelFormatType_1IndexedGray_WhiteIsZero = 33;
  kCVPixelFormatType_2IndexedGray_WhiteIsZero = 34;
  kCVPixelFormatType_4IndexedGray_WhiteIsZero = 36;
  kCVPixelFormatType_8IndexedGray_WhiteIsZero = 40;
  kCVPixelFormatType_16BE555 = 16;
  kCVPixelFormatType_16LE555 = 1278555445;
  kCVPixelFormatType_16LE5551 = 892679473;
  kCVPixelFormatType_16BE565 = 1110783541;
  kCVPixelFormatType_16LE565 = 1278555701;
  kCVPixelFormatType_24RGB = 24;
  kCVPixelFormatType_24BGR = 842285639;
  kCVPixelFormatType_32ARGB = 32;
  kCVPixelFormatType_32BGRA = 1111970369;
  kCVPixelFormatType_32ABGR = 1094862674;
  kCVPixelFormatType_32RGBA = 1380401729;
  kCVPixelFormatType_64ARGB = 1647719521;
  kCVPixelFormatType_48RGB = 1647589490;
  kCVPixelFormatType_32AlphaGray = 1647522401;
  kCVPixelFormatType_16Gray = 1647392359;
  kCVPixelFormatType_30RGB = 1378955371;
  kCVPixelFormatType_422YpCbCr8 = 846624121;
  kCVPixelFormatType_4444YpCbCrA8 = 1983131704;
  kCVPixelFormatType_4444YpCbCrA8R = 1916022840;
  kCVPixelFormatType_4444AYpCbCr8 = 2033463352;
  kCVPixelFormatType_4444AYpCbCr16 = 2033463606;
  kCVPixelFormatType_444YpCbCr8 = 1983066168;
  kCVPixelFormatType_422YpCbCr16 = 1983000886;
  kCVPixelFormatType_422YpCbCr10 = 1983000880;
  kCVPixelFormatType_444YpCbCr10 = 1983131952;
  kCVPixelFormatType_420YpCbCr8Planar = 2033463856;
  kCVPixelFormatType_420YpCbCr8PlanarFullRange = 1714696752;
  kCVPixelFormatType_422YpCbCr_4A_8BiPlanar = 1630697081;
  kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange = 875704438;
  kCVPixelFormatType_420YpCbCr8BiPlanarFullRange = 875704422;
  kCVPixelFormatType_422YpCbCr8_yuvs = 2037741171;
  kCVPixelFormatType_422YpCbCr8FullRange = 2037741158;
  kCVPixelFormatType_OneComponent8 = 1278226488;
  kCVPixelFormatType_TwoComponent8 = 843264056;
  kCVPixelFormatType_OneComponent16Half = 1278226536;
  kCVPixelFormatType_OneComponent32Float = 1278226534;
  kCVPixelFormatType_TwoComponent16Half = 843264104;
  kCVPixelFormatType_TwoComponent32Float = 843264102;
  kCVPixelFormatType_64RGBAHalf = 1380411457;
  kCVPixelFormatType_128RGBAFloat = 1380410945;
  kCVPixelBufferLock_ReadOnly = 1;
  kCVPixelBufferPoolFlushExcessBuffers = 1;

type

  // ===== Forward declarations =====
{$M+}
  MTLTexture = interface;
  MTLDevice = interface;

  // ===== Framework typedefs =====
{$M+}
  CVOptionFlags = UInt64;

  CVSMPTETime = record
    subframes: Int16;
    subframeDivisor: Int16;
    counter: UInt32;
    &type: UInt32;
    flags: UInt32;
    hours: Int16;
    minutes: Int16;
    seconds: Int16;
    frames: Int16;
  end;

  PCVSMPTETime = ^CVSMPTETime;

  CVTime = record
    timeValue: Int64;
    timeScale: Int32;
    flags: Int32;
  end;

  PCVTime = ^CVTime;

  CVTimeStamp = record
    version: LongWord;
    videoTimeScale: Int32;
    videoTime: Int64;
    hostTime: UInt64;
    rateScalar: Double;
    videoRefreshPeriod: Int64;
    smpteTime: CVSMPTETime;
    flags: UInt64;
    reserved: UInt64;
  end;

  PCVTimeStamp = ^CVTimeStamp;

  CVReturn = Int32;
  CFStringRef = Pointer;
  CVAttachmentMode = LongWord;
  CVBufferRef = Pointer;
  CFTypeRef = Pointer;
  CFDictionaryRef = Pointer;
  CVImageBufferRef = CVBufferRef;
  CGFloat = Single;
  CGSize = CGSize = record width: CGFloat;
height:
CGFloat;
end;
PCGSize = ^CGSize;;
CGPoint = CGPoint = record x: CGFloat;
y:
CGFloat;
end;
PCGPoint = ^CGPoint;;
CGRect = CGRect = record origin: CGPoint;
size:
CGSize;
end;
PCGRect = ^CGRect;;
Boolean = Byte;
CVPixelBufferLockFlags = CVOptionFlags;

CVPlanarComponentInfo = record offset: Int32;
rowBytes:
LongWord;
end;
PCVPlanarComponentInfo = ^CVPlanarComponentInfo;

CVPlanarPixelBufferInfo = record componentInfo: array [0 .. 0]
  of CVPlanarComponentInfo;
end;
PCVPlanarPixelBufferInfo = ^CVPlanarPixelBufferInfo;

CVPlanarPixelBufferInfo_YCbCrPlanar = record componentInfoY
  : CVPlanarComponentInfo;
componentInfoCb:
CVPlanarComponentInfo;
componentInfoCr:
CVPlanarComponentInfo;
end;
PCVPlanarPixelBufferInfo_YCbCrPlanar = ^CVPlanarPixelBufferInfo_YCbCrPlanar;

CVPlanarPixelBufferInfo_YCbCrBiPlanar = record componentInfoY
  : CVPlanarComponentInfo;
componentInfoCbCr:
CVPlanarComponentInfo;
end;
PCVPlanarPixelBufferInfo_YCbCrBiPlanar = ^CVPlanarPixelBufferInfo_YCbCrBiPlanar;

CVPixelBufferRef = CVImageBufferRef;
CFTypeID = LongWord;
CFAllocatorRef = Pointer;
CFArrayRef = Pointer;
__darwin_size_t = LongWord;
FourCharCode = UInt32;
OSType = FourCharCode;
CVPixelBufferReleaseBytesCallback =
procedure(param1: Pointer; param2: Pointer);
cdecl;
CVPixelBufferReleasePlanarBytesCallback =
procedure(param1: Pointer; param2: Pointer; param3: LongWord; param4: LongWord;
  param5: Pointer);
cdecl;
CVPixelBufferPoolRef = Pointer;
CVPixelBufferPoolFlushFlags = CVOptionFlags;
CVOpenGLESTextureRef = CVImageBufferRef;
GLenum = LongWord;
GLuint = LongWord;
GLfloat = Single;
CVOpenGLESTextureCacheRef = Pointer;
CVEAGLContext = EAGLContext;
GLint = Int32;
GLsizei = Int32;
CVFillExtendedPixelsCallBack =
function(param1: CVPixelBufferRef; param2: Pointer): Boolean;
cdecl;
CFIndex = LongInt;

CVFillExtendedPixelsCallBackData = record version: CFIndex;
fillCallBack:
CVFillExtendedPixelsCallBack;
refCon:
Pointer;
end;
PCVFillExtendedPixelsCallBackData = ^CVFillExtendedPixelsCallBackData;

CVMetalTextureRef = CVImageBufferRef;
CVMetalTextureCacheRef = Pointer;
NSUInteger = Cardinal;
MTLPixelFormat = NSUInteger;
// ===== Protocol declarations =====

MTLTexture = interface(IObjectiveC)['{F1B1A78E-D3AF-459D-BF41-140F0F768A78}']
end;

MTLDevice = interface(IObjectiveC)['{B1FE4040-9F7A-43B8-9823-804328771B94}']
end;

// ===== Exported string consts =====

function kCVZeroTime: Pointer;
  function kCVIndefiniteTime: Pointer;
    function kCVBufferPropagatedAttachmentsKey: Pointer;
      function kCVBufferNonPropagatedAttachmentsKey: Pointer;
        function kCVBufferMovieTimeKey: Pointer;
          function kCVBufferTimeValueKey: Pointer;
            function kCVBufferTimeScaleKey: Pointer;
              function kCVImageBufferCGColorSpaceKey: Pointer;
                function kCVImageBufferCleanApertureKey: Pointer;
                  function kCVImageBufferCleanApertureWidthKey: Pointer;
                    function kCVImageBufferCleanApertureHeightKey: Pointer;
                      function kCVImageBufferCleanApertureHorizontalOffsetKey
                        : Pointer;
                        function kCVImageBufferCleanApertureVerticalOffsetKey
                          : Pointer;
                          function kCVImageBufferPreferredCleanApertureKey
                            : Pointer;
                            function kCVImageBufferFieldCountKey: Pointer;
                              function kCVImageBufferFieldDetailKey: Pointer;
                                function kCVImageBufferFieldDetailTemporalTopFirst
                                  : Pointer;
                                  function kCVImageBufferFieldDetailTemporalBottomFirst
                                    : Pointer;
                                    function kCVImageBufferFieldDetailSpatialFirstLineEarly
                                      : Pointer;
                                      function kCVImageBufferFieldDetailSpatialFirstLineLate
                                        : Pointer;
                                        function kCVImageBufferPixelAspectRatioKey
                                        : Pointer;
                                        function kCVImageBufferPixelAspectRatioHorizontalSpacingKey
                                        : Pointer;
                                        function kCVImageBufferPixelAspectRatioVerticalSpacingKey
                                        : Pointer;
                                        function kCVImageBufferDisplayDimensionsKey
                                        : Pointer;
                                        function kCVImageBufferDisplayWidthKey
                                        : Pointer;
                                        function kCVImageBufferDisplayHeightKey
                                        : Pointer;
                                        function kCVImageBufferGammaLevelKey
                                        : Pointer;
                                        function kCVImageBufferICCProfileKey
                                        : Pointer;
                                        function kCVImageBufferYCbCrMatrixKey
                                        : Pointer;
                                        function kCVImageBufferYCbCrMatrix_ITU_R_709_2
                                        : Pointer;
                                        function kCVImageBufferYCbCrMatrix_ITU_R_601_4
                                        : Pointer;
                                        function kCVImageBufferYCbCrMatrix_SMPTE_240M_1995
                                        : Pointer;
                                        function kCVImageBufferYCbCrMatrix_DCI_P3
                                        : Pointer;
                                        function kCVImageBufferYCbCrMatrix_P3_D65
                                        : Pointer;
                                        function kCVImageBufferYCbCrMatrix_ITU_R_2020
                                        : Pointer;
                                        function kCVImageBufferColorPrimariesKey
                                        : Pointer;
                                        function kCVImageBufferColorPrimaries_ITU_R_709_2
                                        : Pointer;
                                        function kCVImageBufferColorPrimaries_EBU_3213
                                        : Pointer;
                                        function kCVImageBufferColorPrimaries_SMPTE_C
                                        : Pointer;
                                        function kCVImageBufferColorPrimaries_P22
                                        : Pointer;
                                        function kCVImageBufferColorPrimaries_DCI_P3
                                        : Pointer;
                                        function kCVImageBufferColorPrimaries_P3_D65
                                        : Pointer;
                                        function kCVImageBufferColorPrimaries_ITU_R_2020
                                        : Pointer;
                                        function kCVImageBufferTransferFunctionKey
                                        : Pointer;
                                        function kCVImageBufferTransferFunction_ITU_R_709_2
                                        : Pointer;
                                        function kCVImageBufferTransferFunction_SMPTE_240M_1995
                                        : Pointer;
                                        function kCVImageBufferTransferFunction_UseGamma
                                        : Pointer;
                                        function kCVImageBufferTransferFunction_EBU_3213
                                        : Pointer;
                                        function kCVImageBufferTransferFunction_SMPTE_C
                                        : Pointer;
                                        function kCVImageBufferTransferFunction_ITU_R_2020
                                        : Pointer;
                                        function kCVImageBufferChromaLocationTopFieldKey
                                        : Pointer;
                                        function kCVImageBufferChromaLocationBottomFieldKey
                                        : Pointer;
                                        function kCVImageBufferChromaLocation_Left
                                        : Pointer;
                                        function kCVImageBufferChromaLocation_Center
                                        : Pointer;
                                        function kCVImageBufferChromaLocation_TopLeft
                                        : Pointer;
                                        function kCVImageBufferChromaLocation_Top
                                        : Pointer;
                                        function kCVImageBufferChromaLocation_BottomLeft
                                        : Pointer;
                                        function kCVImageBufferChromaLocation_Bottom
                                        : Pointer;
                                        function kCVImageBufferChromaLocation_DV420
                                        : Pointer;
                                        function kCVImageBufferChromaSubsamplingKey
                                        : Pointer;
                                        function kCVImageBufferChromaSubsampling_420
                                        : Pointer;
                                        function kCVImageBufferChromaSubsampling_422
                                        : Pointer;
                                        function kCVImageBufferChromaSubsampling_411
                                        : Pointer;
                                        function kCVImageBufferAlphaChannelIsOpaque
                                        : Pointer;
                                        function kCVPixelBufferPixelFormatTypeKey
                                        : Pointer;
                                        function kCVPixelBufferMemoryAllocatorKey
                                        : Pointer;
                                        function kCVPixelBufferWidthKey
                                        : Pointer;
                                        function kCVPixelBufferHeightKey
                                        : Pointer;
                                        function kCVPixelBufferExtendedPixelsLeftKey
                                        : Pointer;
                                        function kCVPixelBufferExtendedPixelsTopKey
                                        : Pointer;
                                        function kCVPixelBufferExtendedPixelsRightKey
                                        : Pointer;
                                        function kCVPixelBufferExtendedPixelsBottomKey
                                        : Pointer;
                                        function kCVPixelBufferBytesPerRowAlignmentKey
                                        : Pointer;
                                        function kCVPixelBufferCGBitmapContextCompatibilityKey
                                        : Pointer;
                                        function kCVPixelBufferCGImageCompatibilityKey
                                        : Pointer;
                                        function kCVPixelBufferOpenGLCompatibilityKey
                                        : Pointer;
                                        function kCVPixelBufferPlaneAlignmentKey
                                        : Pointer;
                                        function kCVPixelBufferIOSurfacePropertiesKey
                                        : Pointer;
                                        function kCVPixelBufferOpenGLESCompatibilityKey
                                        : Pointer;
                                        function kCVPixelBufferMetalCompatibilityKey
                                        : Pointer;
                                        function kCVPixelBufferOpenGLTextureCacheCompatibilityKey
                                        : Pointer;
                                        function kCVPixelBufferOpenGLESTextureCacheCompatibilityKey
                                        : Pointer;
                                        function kCVPixelBufferPoolMinimumBufferCountKey
                                        : Pointer;
                                        function kCVPixelBufferPoolMaximumBufferAgeKey
                                        : Pointer;
                                        function kCVPixelBufferPoolAllocationThresholdKey
                                        : Pointer;
                                        function kCVPixelBufferPoolFreeBufferNotification
                                        : Pointer;
                                        function kCVOpenGLESTextureCacheMaximumTextureAgeKey
                                        : Pointer;
                                        function kCVPixelFormatName: Pointer;
                                        function kCVPixelFormatConstant
                                        : Pointer;
                                        function kCVPixelFormatCodecType
                                        : Pointer;
                                        function kCVPixelFormatFourCC: Pointer;
                                        function kCVPixelFormatContainsAlpha
                                        : Pointer;
                                        function kCVPixelFormatContainsYCbCr
                                        : Pointer;
                                        function kCVPixelFormatContainsRGB
                                        : Pointer;
                                        function kCVPixelFormatComponentRange
                                        : Pointer;
                                        function kCVPixelFormatComponentRange_VideoRange
                                        : Pointer;
                                        function kCVPixelFormatComponentRange_FullRange
                                        : Pointer;
                                        function kCVPixelFormatComponentRange_WideRange
                                        : Pointer;
                                        function kCVPixelFormatPlanes: Pointer;
                                        function kCVPixelFormatBlockWidth
                                        : Pointer;
                                        function kCVPixelFormatBlockHeight
                                        : Pointer;
                                        function kCVPixelFormatBitsPerBlock
                                        : Pointer;
                                        function kCVPixelFormatBlockHorizontalAlignment
                                        : Pointer;
                                        function kCVPixelFormatBlockVerticalAlignment
                                        : Pointer;
                                        function kCVPixelFormatBlackBlock
                                        : Pointer;
                                        function kCVPixelFormatHorizontalSubsampling
                                        : Pointer;
                                        function kCVPixelFormatVerticalSubsampling
                                        : Pointer;
                                        function kCVPixelFormatOpenGLFormat
                                        : Pointer;
                                        function kCVPixelFormatOpenGLType
                                        : Pointer;
                                        function kCVPixelFormatOpenGLInternalFormat
                                        : Pointer;
                                        function kCVPixelFormatCGBitmapInfo
                                        : Pointer;
                                        function kCVPixelFormatQDCompatibility
                                        : Pointer;
                                        function kCVPixelFormatCGBitmapContextCompatibility
                                        : Pointer;
                                        function kCVPixelFormatCGImageCompatibility
                                        : Pointer;
                                        function kCVPixelFormatOpenGLCompatibility
                                        : Pointer;
                                        function kCVPixelFormatOpenGLESCompatibility
                                        : Pointer;
                                        function kCVPixelFormatFillExtendedPixelsCallback
                                        : Pointer;
                                        function kCVMetalTextureCacheMaximumTextureAgeKey
                                        : Pointer;


                                        // ===== External functions =====

                                        const
                                        libCoreVideo =
                                        '/System/Library/Frameworks/CoreVideo.framework/CoreVideo';
                                        function CVBufferRetain
                                        (buffer: CVBufferRef): CVBufferRef;
                                        cdecl; external libCoreVideo name _PU +
                                        'CVBufferRetain';
                                        procedure CVBufferRelease
                                        (buffer: CVBufferRef); cdecl;
                                        external libCoreVideo name _PU +
                                        'CVBufferRelease';
                                        procedure CVBufferSetAttachment
                                        (buffer: CVBufferRef; key: CFStringRef;
                                        value: CFTypeRef;
                                        attachmentMode: CVAttachmentMode);
                                        cdecl; external libCoreVideo name _PU +
                                        'CVBufferSetAttachment';
                                        function CVBufferGetAttachment
                                        (buffer: CVBufferRef; key: CFStringRef;
                                        attachmentMode: PLongWord): CFTypeRef;
                                        cdecl; external libCoreVideo name _PU +
                                        'CVBufferGetAttachment';
                                        procedure CVBufferRemoveAttachment
                                        (buffer: CVBufferRef; key: CFStringRef);
                                        cdecl; external libCoreVideo name _PU +
                                        'CVBufferRemoveAttachment';
                                        procedure CVBufferRemoveAllAttachments
                                        (buffer: CVBufferRef); cdecl;
                                        external libCoreVideo name _PU +
                                        'CVBufferRemoveAllAttachments';
                                        function CVBufferGetAttachments
                                        (buffer: CVBufferRef;
                                        attachmentMode: CVAttachmentMode)
                                        : CFDictionaryRef; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVBufferGetAttachments';
                                        procedure CVBufferSetAttachments
                                        (buffer: CVBufferRef;
                                        theAttachments: CFDictionaryRef;
                                        attachmentMode: CVAttachmentMode);
                                        cdecl; external libCoreVideo name _PU +
                                        'CVBufferSetAttachments';
                                        procedure CVBufferPropagateAttachments
                                        (sourceBuffer: CVBufferRef;
                                        destinationBuffer: CVBufferRef); cdecl;
                                        external libCoreVideo name _PU +
                                        'CVBufferPropagateAttachments';
                                        function CVImageBufferGetEncodedSize
                                        (imageBuffer: CVImageBufferRef): CGSize;
                                        cdecl; external libCoreVideo name _PU +
                                        'CVImageBufferGetEncodedSize';
                                        function CVImageBufferGetDisplaySize
                                        (imageBuffer: CVImageBufferRef): CGSize;
                                        cdecl; external libCoreVideo name _PU +
                                        'CVImageBufferGetDisplaySize';
                                        function CVImageBufferGetCleanRect
                                        (imageBuffer: CVImageBufferRef): CGRect;
                                        cdecl; external libCoreVideo name _PU +
                                        'CVImageBufferGetCleanRect';
                                        function CVImageBufferIsFlipped
                                        (imageBuffer: CVImageBufferRef)
                                        : Boolean; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVImageBufferIsFlipped';
                                        function CVPixelBufferGetTypeID
                                        : CFTypeID; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferGetTypeID';
                                        function CVPixelBufferRetain
                                        (texture: CVPixelBufferRef)
                                        : CVPixelBufferRef; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferRetain';
                                        procedure CVPixelBufferRelease
                                        (texture: CVPixelBufferRef); cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferRelease';
                                        function CVPixelBufferCreateResolvedAttributesDictionary
                                        (allocator: CFAllocatorRef;
                                        attributes: CFArrayRef;
                                        resolvedDictionaryOut: Pointer)
                                        : CVReturn; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferCreateResolvedAttributesDictionary';
                                        function CVPixelBufferCreate
                                        (allocator: CFAllocatorRef;
                                        width: LongWord; height: LongWord;
                                        pixelFormatType: OSType;
                                        pixelBufferAttributes: CFDictionaryRef;
                                        pixelBufferOut: Pointer): CVReturn;
                                        cdecl; external libCoreVideo name _PU +
                                        'CVPixelBufferCreate';
                                        function CVPixelBufferCreateWithBytes
                                        (allocator: CFAllocatorRef;
                                        width: LongWord; height: LongWord;
                                        pixelFormatType: OSType;
                                        baseAddress: Pointer;
                                        bytesPerRow: LongWord;
                                        releaseCallback
                                        : CVPixelBufferReleaseBytesCallback;
                                        releaseRefCon: Pointer;
                                        pixelBufferAttributes: CFDictionaryRef;
                                        pixelBufferOut: Pointer): CVReturn;
                                        cdecl; external libCoreVideo name _PU +
                                        'CVPixelBufferCreateWithBytes';
                                        function CVPixelBufferCreateWithPlanarBytes
                                        (allocator: CFAllocatorRef;
                                        width: LongWord; height: LongWord;
                                        pixelFormatType: OSType;
                                        dataPtr: Pointer; dataSize: LongWord;
                                        numberOfPlanes: LongWord;
                                        planeBaseAddress: Pointer;
                                        planeWidth: LongWord;
                                        planeHeight: LongWord;
                                        planeBytesPerRow: LongWord;
                                        releaseCallback
                                        : CVPixelBufferReleasePlanarBytesCallback;
                                        releaseRefCon: Pointer;
                                        pixelBufferAttributes: CFDictionaryRef;
                                        pixelBufferOut: Pointer): CVReturn;
                                        cdecl; external libCoreVideo name _PU +
                                        'CVPixelBufferCreateWithPlanarBytes';
                                        function CVPixelBufferLockBaseAddress
                                        (pixelBuffer: CVPixelBufferRef;
                                        lockFlags: CVPixelBufferLockFlags)
                                        : CVReturn; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferLockBaseAddress';
                                        function CVPixelBufferUnlockBaseAddress
                                        (pixelBuffer: CVPixelBufferRef;
                                        unlockFlags: CVPixelBufferLockFlags)
                                        : CVReturn; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferUnlockBaseAddress';
                                        function CVPixelBufferGetWidth
                                        (pixelBuffer: CVPixelBufferRef)
                                        : LongWord; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferGetWidth';
                                        function CVPixelBufferGetHeight
                                        (pixelBuffer: CVPixelBufferRef)
                                        : LongWord; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferGetHeight';
                                        function CVPixelBufferGetPixelFormatType
                                        (pixelBuffer: CVPixelBufferRef): OSType;
                                        cdecl; external libCoreVideo name _PU +
                                        'CVPixelBufferGetPixelFormatType';
                                        function CVPixelBufferGetBaseAddress
                                        (pixelBuffer: CVPixelBufferRef)
                                        : Pointer; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferGetBaseAddress';
                                        function CVPixelBufferGetBytesPerRow
                                        (pixelBuffer: CVPixelBufferRef)
                                        : LongWord; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferGetBytesPerRow';
                                        function CVPixelBufferGetDataSize
                                        (pixelBuffer: CVPixelBufferRef)
                                        : LongWord; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferGetDataSize';
                                        function CVPixelBufferIsPlanar
                                        (pixelBuffer: CVPixelBufferRef)
                                        : Boolean; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferIsPlanar';
                                        function CVPixelBufferGetPlaneCount
                                        (pixelBuffer: CVPixelBufferRef)
                                        : LongWord; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferGetPlaneCount';
                                        function CVPixelBufferGetWidthOfPlane
                                        (pixelBuffer: CVPixelBufferRef;
                                        planeIndex: LongWord): LongWord; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferGetWidthOfPlane';
                                        function CVPixelBufferGetHeightOfPlane
                                        (pixelBuffer: CVPixelBufferRef;
                                        planeIndex: LongWord): LongWord; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferGetHeightOfPlane';
                                        function CVPixelBufferGetBaseAddressOfPlane
                                        (pixelBuffer: CVPixelBufferRef;
                                        planeIndex: LongWord): Pointer; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferGetBaseAddressOfPlane';
                                        function CVPixelBufferGetBytesPerRowOfPlane
                                        (pixelBuffer: CVPixelBufferRef;
                                        planeIndex: LongWord): LongWord; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferGetBytesPerRowOfPlane';
                                        procedure CVPixelBufferGetExtendedPixels
                                        (pixelBuffer: CVPixelBufferRef;
                                        extraColumnsOnLeft: PLongWord;
                                        extraColumnsOnRight: PLongWord;
                                        extraRowsOnTop: PLongWord;
                                        extraRowsOnBottom: PLongWord); cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferGetExtendedPixels';
                                        function CVPixelBufferFillExtendedPixels
                                        (pixelBuffer: CVPixelBufferRef)
                                        : CVReturn; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferFillExtendedPixels';
                                        function CVPixelBufferPoolGetTypeID
                                        : CFTypeID; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferPoolGetTypeID';
                                        function CVPixelBufferPoolRetain
                                        (pixelBufferPool: CVPixelBufferPoolRef)
                                        : CVPixelBufferPoolRef; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferPoolRetain';
                                        procedure CVPixelBufferPoolRelease
                                        (pixelBufferPool: CVPixelBufferPoolRef);
                                        cdecl; external libCoreVideo name _PU +
                                        'CVPixelBufferPoolRelease';
                                        function CVPixelBufferPoolCreate
                                        (allocator: CFAllocatorRef;
                                        poolAttributes: CFDictionaryRef;
                                        pixelBufferAttributes: CFDictionaryRef;
                                        poolOut: Pointer): CVReturn; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferPoolCreate';
                                        function CVPixelBufferPoolGetAttributes
                                        (pool: CVPixelBufferPoolRef)
                                        : CFDictionaryRef; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferPoolGetAttributes';
                                        function CVPixelBufferPoolGetPixelBufferAttributes
                                        (pool: CVPixelBufferPoolRef)
                                        : CFDictionaryRef; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelBufferPoolGetPixelBufferAttributes';
                                        function CVPixelBufferPoolCreatePixelBuffer
                                        (allocator: CFAllocatorRef;
                                        pixelBufferPool: CVPixelBufferPoolRef;
                                        pixelBufferOut: Pointer): CVReturn;
                                        cdecl; external libCoreVideo name _PU +
                                        'CVPixelBufferPoolCreatePixelBuffer';
                                        function CVPixelBufferPoolCreatePixelBufferWithAuxAttributes
                                        (allocator: CFAllocatorRef;
                                        pixelBufferPool: CVPixelBufferPoolRef;
                                        auxAttributes: CFDictionaryRef;
                                        pixelBufferOut: Pointer): CVReturn;
                                        cdecl; external libCoreVideo name _PU +
                                        'CVPixelBufferPoolCreatePixelBufferWithAuxAttributes';
                                        procedure CVPixelBufferPoolFlush
                                        (pool: CVPixelBufferPoolRef;
                                        options: CVPixelBufferPoolFlushFlags);
                                        cdecl; external libCoreVideo name _PU +
                                        'CVPixelBufferPoolFlush';
                                        function CVOpenGLESTextureGetTypeID
                                        : CFTypeID; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVOpenGLESTextureGetTypeID';
                                        function CVOpenGLESTextureGetTarget
                                        (image: CVOpenGLESTextureRef): GLenum;
                                        cdecl; external libCoreVideo name _PU +
                                        'CVOpenGLESTextureGetTarget';
                                        function CVOpenGLESTextureGetName
                                        (image: CVOpenGLESTextureRef): GLuint;
                                        cdecl; external libCoreVideo name _PU +
                                        'CVOpenGLESTextureGetName';
                                        function CVOpenGLESTextureIsFlipped
                                        (image: CVOpenGLESTextureRef): Boolean;
                                        cdecl; external libCoreVideo name _PU +
                                        'CVOpenGLESTextureIsFlipped';
                                        procedure CVOpenGLESTextureGetCleanTexCoords
                                        (image: CVOpenGLESTextureRef;
                                        lowerLeft: GLfloat; lowerRight: GLfloat;
                                        upperRight: GLfloat;
                                        upperLeft: GLfloat); cdecl;
                                        external libCoreVideo name _PU +
                                        'CVOpenGLESTextureGetCleanTexCoords';
                                        function CVOpenGLESTextureCacheGetTypeID
                                        : CFTypeID; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVOpenGLESTextureCacheGetTypeID';
                                        function CVOpenGLESTextureCacheCreate
                                        (allocator: CFAllocatorRef;
                                        cacheAttributes: CFDictionaryRef;
                                        EAGLContext: Pointer { CVEAGLContext };
                                        textureAttributes: CFDictionaryRef;
                                        cacheOut: Pointer): CVReturn; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVOpenGLESTextureCacheCreate';
                                        function CVOpenGLESTextureCacheCreateTextureFromImage
                                        (allocator: CFAllocatorRef;
                                        textureCache: CVOpenGLESTextureCacheRef;
                                        sourceImage: CVImageBufferRef;
                                        textureAttributes: CFDictionaryRef;
                                        target: GLenum; internalFormat: GLint;
                                        width: GLsizei; height: GLsizei;
                                        format: GLenum; &type: GLenum;
                                        planeIndex: LongWord;
                                        textureOut: Pointer): CVReturn; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVOpenGLESTextureCacheCreateTextureFromImage';
                                        procedure CVOpenGLESTextureCacheFlush
                                        (textureCache
                                        : CVOpenGLESTextureCacheRef;
                                        options: CVOptionFlags); cdecl;
                                        external libCoreVideo name _PU +
                                        'CVOpenGLESTextureCacheFlush';
                                        function CVPixelFormatDescriptionCreateWithPixelFormatType
                                        (allocator: CFAllocatorRef;
                                        pixelFormat: OSType): CFDictionaryRef;
                                        cdecl; external libCoreVideo name _PU +
                                        'CVPixelFormatDescriptionCreateWithPixelFormatType';
                                        function CVPixelFormatDescriptionArrayCreateWithAllPixelFormatTypes
                                        (allocator: CFAllocatorRef): CFArrayRef;
                                        cdecl; external libCoreVideo name _PU +
                                        'CVPixelFormatDescriptionArrayCreateWithAllPixelFormatTypes';
                                        procedure CVPixelFormatDescriptionRegisterDescriptionWithPixelFormatType
                                        (description: CFDictionaryRef;
                                        pixelFormat: OSType); cdecl;
                                        external libCoreVideo name _PU +
                                        'CVPixelFormatDescriptionRegisterDescriptionWithPixelFormatType';
                                        function CVMetalTextureGetTypeID
                                        : CFTypeID; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVMetalTextureGetTypeID';
                                        function CVMetalTextureGetTexture
                                        (image: CVMetalTextureRef): Pointer;
                                        cdecl; external libCoreVideo name _PU +
                                        'CVMetalTextureGetTexture';
                                        function CVMetalTextureIsFlipped
                                        (image: CVMetalTextureRef): Boolean;
                                        cdecl; external libCoreVideo name _PU +
                                        'CVMetalTextureIsFlipped';
                                        procedure CVMetalTextureGetCleanTexCoords
                                        (image: CVMetalTextureRef;
                                        lowerLeft: Single; lowerRight: Single;
                                        upperRight: Single; upperLeft: Single);
                                        cdecl; external libCoreVideo name _PU +
                                        'CVMetalTextureGetCleanTexCoords';
                                        function CVMetalTextureCacheGetTypeID
                                        : CFTypeID; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVMetalTextureCacheGetTypeID';
                                        function CVMetalTextureCacheCreate
                                        (allocator: CFAllocatorRef;
                                        cacheAttributes: CFDictionaryRef;
                                        metalDevice: Pointer;
                                        textureAttributes: CFDictionaryRef;
                                        cacheOut: Pointer): CVReturn; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVMetalTextureCacheCreate';
                                        function CVMetalTextureCacheCreateTextureFromImage
                                        (allocator: CFAllocatorRef;
                                        textureCache: CVMetalTextureCacheRef;
                                        sourceImage: CVImageBufferRef;
                                        textureAttributes: CFDictionaryRef;
                                        pixelFormat: MTLPixelFormat;
                                        width: LongWord; height: LongWord;
                                        planeIndex: LongWord;
                                        textureOut: Pointer): CVReturn; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVMetalTextureCacheCreateTextureFromImage';
                                        procedure CVMetalTextureCacheFlush
                                        (textureCache: CVMetalTextureCacheRef;
                                        options: CVOptionFlags); cdecl;
                                        external libCoreVideo name _PU +
                                        'CVMetalTextureCacheFlush';
                                        function CVGetCurrentHostTime: UInt64;
                                        cdecl; external libCoreVideo name _PU +
                                        'CVGetCurrentHostTime';
                                        function CVGetHostClockFrequency
                                        : Double; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVGetHostClockFrequency';
                                        function CVGetHostClockMinimumTimeDelta
                                        : LongWord; cdecl;
                                        external libCoreVideo name _PU +
                                        'CVGetHostClockMinimumTimeDelta';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  CoreVideoModule: THandle;

{$ENDIF IOS}

function kCVZeroTime: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVZeroTime');
end;

function kCVIndefiniteTime: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVIndefiniteTime');
end;

function kCVBufferPropagatedAttachmentsKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVBufferPropagatedAttachmentsKey');
end;

function kCVBufferNonPropagatedAttachmentsKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVBufferNonPropagatedAttachmentsKey');
end;

function kCVBufferMovieTimeKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVBufferMovieTimeKey');
end;

function kCVBufferTimeValueKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVBufferTimeValueKey');
end;

function kCVBufferTimeScaleKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVBufferTimeScaleKey');
end;

function kCVImageBufferCGColorSpaceKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVImageBufferCGColorSpaceKey');
end;

function kCVImageBufferCleanApertureKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVImageBufferCleanApertureKey');
end;

function kCVImageBufferCleanApertureWidthKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferCleanApertureWidthKey');
end;

function kCVImageBufferCleanApertureHeightKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferCleanApertureHeightKey');
end;

function kCVImageBufferCleanApertureHorizontalOffsetKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferCleanApertureHorizontalOffsetKey');
end;

function kCVImageBufferCleanApertureVerticalOffsetKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferCleanApertureVerticalOffsetKey');
end;

function kCVImageBufferPreferredCleanApertureKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferPreferredCleanApertureKey');
end;

function kCVImageBufferFieldCountKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVImageBufferFieldCountKey');
end;

function kCVImageBufferFieldDetailKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVImageBufferFieldDetailKey');
end;

function kCVImageBufferFieldDetailTemporalTopFirst: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferFieldDetailTemporalTopFirst');
end;

function kCVImageBufferFieldDetailTemporalBottomFirst: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferFieldDetailTemporalBottomFirst');
end;

function kCVImageBufferFieldDetailSpatialFirstLineEarly: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferFieldDetailSpatialFirstLineEarly');
end;

function kCVImageBufferFieldDetailSpatialFirstLineLate: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferFieldDetailSpatialFirstLineLate');
end;

function kCVImageBufferPixelAspectRatioKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferPixelAspectRatioKey');
end;

function kCVImageBufferPixelAspectRatioHorizontalSpacingKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferPixelAspectRatioHorizontalSpacingKey');
end;

function kCVImageBufferPixelAspectRatioVerticalSpacingKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferPixelAspectRatioVerticalSpacingKey');
end;

function kCVImageBufferDisplayDimensionsKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferDisplayDimensionsKey');
end;

function kCVImageBufferDisplayWidthKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVImageBufferDisplayWidthKey');
end;

function kCVImageBufferDisplayHeightKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVImageBufferDisplayHeightKey');
end;

function kCVImageBufferGammaLevelKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVImageBufferGammaLevelKey');
end;

function kCVImageBufferICCProfileKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVImageBufferICCProfileKey');
end;

function kCVImageBufferYCbCrMatrixKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVImageBufferYCbCrMatrixKey');
end;

function kCVImageBufferYCbCrMatrix_ITU_R_709_2: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferYCbCrMatrix_ITU_R_709_2');
end;

function kCVImageBufferYCbCrMatrix_ITU_R_601_4: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferYCbCrMatrix_ITU_R_601_4');
end;

function kCVImageBufferYCbCrMatrix_SMPTE_240M_1995: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferYCbCrMatrix_SMPTE_240M_1995');
end;

function kCVImageBufferYCbCrMatrix_DCI_P3: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVImageBufferYCbCrMatrix_DCI_P3');
end;

function kCVImageBufferYCbCrMatrix_P3_D65: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVImageBufferYCbCrMatrix_P3_D65');
end;

function kCVImageBufferYCbCrMatrix_ITU_R_2020: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferYCbCrMatrix_ITU_R_2020');
end;

function kCVImageBufferColorPrimariesKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVImageBufferColorPrimariesKey');
end;

function kCVImageBufferColorPrimaries_ITU_R_709_2: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferColorPrimaries_ITU_R_709_2');
end;

function kCVImageBufferColorPrimaries_EBU_3213: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferColorPrimaries_EBU_3213');
end;

function kCVImageBufferColorPrimaries_SMPTE_C: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferColorPrimaries_SMPTE_C');
end;

function kCVImageBufferColorPrimaries_P22: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVImageBufferColorPrimaries_P22');
end;

function kCVImageBufferColorPrimaries_DCI_P3: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferColorPrimaries_DCI_P3');
end;

function kCVImageBufferColorPrimaries_P3_D65: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferColorPrimaries_P3_D65');
end;

function kCVImageBufferColorPrimaries_ITU_R_2020: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferColorPrimaries_ITU_R_2020');
end;

function kCVImageBufferTransferFunctionKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferTransferFunctionKey');
end;

function kCVImageBufferTransferFunction_ITU_R_709_2: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferTransferFunction_ITU_R_709_2');
end;

function kCVImageBufferTransferFunction_SMPTE_240M_1995: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferTransferFunction_SMPTE_240M_1995');
end;

function kCVImageBufferTransferFunction_UseGamma: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferTransferFunction_UseGamma');
end;

function kCVImageBufferTransferFunction_EBU_3213: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferTransferFunction_EBU_3213');
end;

function kCVImageBufferTransferFunction_SMPTE_C: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferTransferFunction_SMPTE_C');
end;

function kCVImageBufferTransferFunction_ITU_R_2020: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferTransferFunction_ITU_R_2020');
end;

function kCVImageBufferChromaLocationTopFieldKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferChromaLocationTopFieldKey');
end;

function kCVImageBufferChromaLocationBottomFieldKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferChromaLocationBottomFieldKey');
end;

function kCVImageBufferChromaLocation_Left: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferChromaLocation_Left');
end;

function kCVImageBufferChromaLocation_Center: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferChromaLocation_Center');
end;

function kCVImageBufferChromaLocation_TopLeft: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferChromaLocation_TopLeft');
end;

function kCVImageBufferChromaLocation_Top: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVImageBufferChromaLocation_Top');
end;

function kCVImageBufferChromaLocation_BottomLeft: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferChromaLocation_BottomLeft');
end;

function kCVImageBufferChromaLocation_Bottom: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferChromaLocation_Bottom');
end;

function kCVImageBufferChromaLocation_DV420: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferChromaLocation_DV420');
end;

function kCVImageBufferChromaSubsamplingKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferChromaSubsamplingKey');
end;

function kCVImageBufferChromaSubsampling_420: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferChromaSubsampling_420');
end;

function kCVImageBufferChromaSubsampling_422: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferChromaSubsampling_422');
end;

function kCVImageBufferChromaSubsampling_411: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferChromaSubsampling_411');
end;

function kCVImageBufferAlphaChannelIsOpaque: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVImageBufferAlphaChannelIsOpaque');
end;

function kCVPixelBufferPixelFormatTypeKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelBufferPixelFormatTypeKey');
end;

function kCVPixelBufferMemoryAllocatorKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelBufferMemoryAllocatorKey');
end;

function kCVPixelBufferWidthKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelBufferWidthKey');
end;

function kCVPixelBufferHeightKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelBufferHeightKey');
end;

function kCVPixelBufferExtendedPixelsLeftKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelBufferExtendedPixelsLeftKey');
end;

function kCVPixelBufferExtendedPixelsTopKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelBufferExtendedPixelsTopKey');
end;

function kCVPixelBufferExtendedPixelsRightKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelBufferExtendedPixelsRightKey');
end;

function kCVPixelBufferExtendedPixelsBottomKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelBufferExtendedPixelsBottomKey');
end;

function kCVPixelBufferBytesPerRowAlignmentKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelBufferBytesPerRowAlignmentKey');
end;

function kCVPixelBufferCGBitmapContextCompatibilityKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelBufferCGBitmapContextCompatibilityKey');
end;

function kCVPixelBufferCGImageCompatibilityKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelBufferCGImageCompatibilityKey');
end;

function kCVPixelBufferOpenGLCompatibilityKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelBufferOpenGLCompatibilityKey');
end;

function kCVPixelBufferPlaneAlignmentKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelBufferPlaneAlignmentKey');
end;

function kCVPixelBufferIOSurfacePropertiesKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelBufferIOSurfacePropertiesKey');
end;

function kCVPixelBufferOpenGLESCompatibilityKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelBufferOpenGLESCompatibilityKey');
end;

function kCVPixelBufferMetalCompatibilityKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelBufferMetalCompatibilityKey');
end;

function kCVPixelBufferOpenGLTextureCacheCompatibilityKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelBufferOpenGLTextureCacheCompatibilityKey');
end;

function kCVPixelBufferOpenGLESTextureCacheCompatibilityKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelBufferOpenGLESTextureCacheCompatibilityKey');
end;

function kCVPixelBufferPoolMinimumBufferCountKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelBufferPoolMinimumBufferCountKey');
end;

function kCVPixelBufferPoolMaximumBufferAgeKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelBufferPoolMaximumBufferAgeKey');
end;

function kCVPixelBufferPoolAllocationThresholdKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelBufferPoolAllocationThresholdKey');
end;

function kCVPixelBufferPoolFreeBufferNotification: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelBufferPoolFreeBufferNotification');
end;

function kCVOpenGLESTextureCacheMaximumTextureAgeKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVOpenGLESTextureCacheMaximumTextureAgeKey');
end;

function kCVPixelFormatName: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelFormatName');
end;

function kCVPixelFormatConstant: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelFormatConstant');
end;

function kCVPixelFormatCodecType: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelFormatCodecType');
end;

function kCVPixelFormatFourCC: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelFormatFourCC');
end;

function kCVPixelFormatContainsAlpha: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelFormatContainsAlpha');
end;

function kCVPixelFormatContainsYCbCr: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelFormatContainsYCbCr');
end;

function kCVPixelFormatContainsRGB: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelFormatContainsRGB');
end;

function kCVPixelFormatComponentRange: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelFormatComponentRange');
end;

function kCVPixelFormatComponentRange_VideoRange: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelFormatComponentRange_VideoRange');
end;

function kCVPixelFormatComponentRange_FullRange: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelFormatComponentRange_FullRange');
end;

function kCVPixelFormatComponentRange_WideRange: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelFormatComponentRange_WideRange');
end;

function kCVPixelFormatPlanes: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelFormatPlanes');
end;

function kCVPixelFormatBlockWidth: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelFormatBlockWidth');
end;

function kCVPixelFormatBlockHeight: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelFormatBlockHeight');
end;

function kCVPixelFormatBitsPerBlock: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelFormatBitsPerBlock');
end;

function kCVPixelFormatBlockHorizontalAlignment: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelFormatBlockHorizontalAlignment');
end;

function kCVPixelFormatBlockVerticalAlignment: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelFormatBlockVerticalAlignment');
end;

function kCVPixelFormatBlackBlock: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelFormatBlackBlock');
end;

function kCVPixelFormatHorizontalSubsampling: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelFormatHorizontalSubsampling');
end;

function kCVPixelFormatVerticalSubsampling: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelFormatVerticalSubsampling');
end;

function kCVPixelFormatOpenGLFormat: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelFormatOpenGLFormat');
end;

function kCVPixelFormatOpenGLType: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelFormatOpenGLType');
end;

function kCVPixelFormatOpenGLInternalFormat: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelFormatOpenGLInternalFormat');
end;

function kCVPixelFormatCGBitmapInfo: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelFormatCGBitmapInfo');
end;

function kCVPixelFormatQDCompatibility: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo, 'kCVPixelFormatQDCompatibility');
end;

function kCVPixelFormatCGBitmapContextCompatibility: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelFormatCGBitmapContextCompatibility');
end;

function kCVPixelFormatCGImageCompatibility: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelFormatCGImageCompatibility');
end;

function kCVPixelFormatOpenGLCompatibility: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelFormatOpenGLCompatibility');
end;

function kCVPixelFormatOpenGLESCompatibility: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelFormatOpenGLESCompatibility');
end;

function kCVPixelFormatFillExtendedPixelsCallback: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVPixelFormatFillExtendedPixelsCallback');
end;

function kCVMetalTextureCacheMaximumTextureAgeKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreVideo,
    'kCVMetalTextureCacheMaximumTextureAgeKey');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CoreVideoModule := dlopen(MarshaledAString(libCoreVideo), RTLD_LAZY);

finalization

dlclose(CoreVideoModule);
{$ENDIF IOS}

end.
